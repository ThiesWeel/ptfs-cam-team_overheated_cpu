import numpy as np
import matplotlib.pyplot as plt

# ─────────── USER-SECTION ─────────────────────────────────────────
freq   = 2.2e9          # [Hz]  core clock we run Fritz at
cores  = 18             # ccNUMA domain = 18 physical cores
# Ice-Lake AVX-512: 2×FMA /cy, 1 FMA=16 FLOP (DP)
flop_per_cyc_core = 2*16
BW = 210e9             # [B/s] STREAM on ONE domain  ← insert your number
#
F_per_LUP = 6          # 5-pt stencil kernel → 6 FLOP per lattice update
B_per_LUP = 40.        # code balance (B / LUP) you modelled
#
grids = {"2000×20000": (2000, 20000),
         "20000×2000": (20000, 2000),
         "1000×400000":(1000, 400000)}
# ─────────────────────────────────────────────────────────────────

Ppeak = freq*flop_per_cyc_core*cores           # compute roof
I_axis = np.logspace(-3, 3, 512)               # FLOP/Byte axis
roof_bw = I_axis*BW

fig, ax = plt.subplots(figsize=(7,5), dpi=110)
ax.loglog(I_axis, np.full_like(I_axis,Ppeak), lw=2, label='Peak compute')
ax.loglog(I_axis, roof_bw,                 lw=2, label='Peak BW')

# Example kernel points (all same I as long as x-dir is innermost)
I_kernel = 1./B_per_LUP * F_per_LUP         # (= FLOP/B)
P_kernel = np.minimum(Ppeak, BW*I_kernel)
for name, _ in grids.items():
    ax.plot(I_kernel, P_kernel,'o')
    ax.text(I_kernel*1.2, P_kernel*1.05, name, ha='left', va='bottom', fontsize=8)

ax.set_xlabel('Operational intensity [FLOP / Byte]')
ax.set_ylabel('Performance [FLOP/s]')
ax.grid(True, which='both', ls=':')
ax.set_xlim(I_axis.min(), I_axis.max())
ax.set_ylim(1e9, 2*Ppeak)
ax.legend(frameon=False, loc='lower right')

# secondary Y-axis in LUP/s  (simply divide by FLOP per LUP)
ax_sec = ax.secondary_yaxis('right',
                            functions=(lambda y: y/F_per_LUP,
                                       lambda y: y*F_per_LUP))
ax_sec.set_ylabel('Performance [LUP/s]')

fig.tight_layout()
plt.show()
