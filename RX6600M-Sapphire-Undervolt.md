# Configurações de Undervolt e PowerPlay - AMD Radeon RX 6600 / RX 6600M (Sapphire / 51RISC Mod)

Este documento consolida todas as configurações de parâmetros de energia, clocks, curvas de tensão, limites térmicos e ventilação extraídas do **MorePowerTool (MPT)** para a placa **AMD Radeon RX 6600M / RX 6600**.

---

## 1. Features (PPTable e Overdrive)

### PPTable Features
* *Feature Control:* Habilitado

### Overdrive Features
* [x] GPU Clock Limit
* [x] GPU Clock Curve
* [x] Memory Clock Limit
* [x] Power Limit
* [x] Timing Tuning
* [ ] Power Mode
* [x] Zero RPM
* [x] Minimum Fan Speed
* [x] Fan Target Temperature Limit
* [x] Operating Temperature Limit
* [x] Fan Acoustic RPM
* [x] Fan Curve
* [x] Auto Undervolt GPU
* [x] Auto Overclock GPU
* [x] Auto Overclock Memory
* [x] Auto Fan Acoustic Limit

---

## 2. PowerPlay Feature Enablement (Ativações de Recursos)

| Recurso | Status | Recurso | Status |
| :--- | :---: | :--- | :---: |
| **DPM_PREFETCHER** | Ativado | **FAN_CONTROL** | Ativado |
| **DPM_GFXCLK** | Ativado | **THERMAL** | Ativado |
| **DPM_GFX_GPO** | Ativado | **GFX_DCS** | Desativado |
| **DPM_UCLK** | Ativado | **RM** | Desativado |
| **DPM_FCLK** | Ativado | **LED_DISPLAY** | Desativado |
| **DPM_SOCCLK** | Ativado | **GFX_SS** | Ativado |
| **DPM_MPOCLK** | Ativado | **OUT_OF_BAND_MONITOR** | Ativado |
| **DPM_LINK** | Ativado | **TEMP_DEPENDENT_VMIN** | Ativado |
| **DPM_DCEFCLK** | Ativado | **MMHUB_PG** | Ativado |
| **DPM_XGMI** | Desativado | **ATHUB_PG** | Ativado |
| **MEM_VDDCI_SCALING** | Ativado | **APCC_DFLL** | Ativado |
| **MEM_MVDD_SCALING** | Ativado | **DF_SUPERV** | Desativado |
| **DS_GFXCLK** | Ativado | **RSMU_SMN_CG** | Ativado |
| **DS_SOCCLK** | Ativado | **DF_CSTATE** | Ativado |
| **DS_FCLK** | Ativado | **2_STEP_PSTATE** | Desativado |
| **DS_LCLK** | Ativado | **SMNCLK_DPM** | Desativado |
| **DS_DCEFCLK** | Ativado | **PERLINK_GMIDOWN** | Desativado |
| **DS_UCLK** | Ativado | **GFX_EDC** | Desativado |
| **GFX_ULV** | Ativado | **GFX_PER_PART_VMIN** | Ativado |
| **FW_DSTATE** | Ativado | **SMART_SHIFT** | Desativado |
| **GFXOFF** | Ativado | **APT** | Desativado |
| **BACO** | Ativado | **VR0HOT** | Ativado |
| **MM_DPM_PG** | Ativado | **FW_CTF** | Ativado |
| **PPT** | Ativado | *Demais spares/extras* | Desativado |
| **TDC** | Ativado | | |

---

## 3. OC Limits (Limites de Overclock e Modos de Energia)

### Overdrive
* **GFX Clock (MHz):** Mínimo: `1700` | Máximo: `2450`
* **Memory Clock (MHz):** Mínimo: `674` | Máximo: `875`
* **Power Limit (%):** Mínimo: `6` | Máximo: `20`
* **Memory Timing Control:** `1`
* **Power Mode Control:** `0`
* **Fan (RPM):** Mínimo: `25` | Máximo: `3600`
* **Fan Acoustic Limit (RPM):** Mínimo: `1000` | Máximo: `3600`
* **Zero RPM Control:** `1`

### Power Modes (Power Limit % / Temp °C) & Acústica (RPM)
| Modo | Power Limit (%) | Temp Alvo (°C) | Limite Acústico (RPM) | Alvo Acústico (RPM) |
| :--- | :---: | :---: | :---: | :---: |
| **Quiet** | 6 | 95 | 6000 | 4500 |
| **Balanced** | 0 | 95 | 6000 | 4500 |
| **Turbo** | 6 | 95 | 2250 | 1750 |
| **Rage** | 0 | 95 | 2250 | 1750 |

---

## 4. Power (Alimentação, Tensões e Correntes)

* **Voltage Vmin / Vmax (mV):**
  * **GFX:** Vmin `775` / Vmax `950`
  * **SoC:** Vmin `762` / Vmax `1050`
* **Power Limit (W):**
  * **GPU:** `120` W
* **TDC Limits (A):**
  * **GFX:** `120` A
  * **SoC:** `22` A
* **ULV Vmin / Offset (mV):**
  * **GFX:** Vmin `0` / Offset `25`
  * **SoC:** Vmin `750` / Offset `12`
* **Memory VDDCI (mV) / MVDD (mV):**
  * **DPM 0:** VDDCI `675` / MVDD `1250`
  * **DPM 1:** VDDCI `850` / MVDD `1350`
  * **DPM 2:** VDDCI `850` / MVDD `1350`
  * **DPM 3:** VDDCI `850` / MVDD `1350`
* **Temperature Dependent Vmin:**
  * **TVmin / Hysteresis (°C):** GFX: `55 / 5` | SoC: `55 / 5`
  * **Vmin Low / High (mV):** GFX: `775 / 775` | SoC: `762 / 762`

---

## 5. Frequency (Frequências e DPM)

### Min / Max (MHz)
* **GFX:** `1700` / `2450`
* **Soc:** `418` / `1280`
* **Vclk:** `690` / `1429`
* **Dclk:** `572` / `1250`
* **Dcefclk:** `418` / `1200`
* **Dispclk:** `487` / `1217`
* **Pixclk:** `487` / `1217`
* **Phydclk:** `300` / `810`
* **Dtbclk:** `487` / `1217`
* **Fclk:** `500` / `1800`

### Memory DPM / Divider
* **DPM 0:** `97` MHz (Divisor: `0`)
* **DPM 1:** `542` MHz (Divisor: `3`)
* **DPM 2:** `676` MHz (Divisor: `3`)
* **DPM 3:** `875` MHz (Divisor: `3`)

### Configurações Auxiliares de Link e Frequência
* **Memory Access At Last Level (FclkBoostFreq):** `1800` MHz
* **Link DPM Settings:**
  * **PcieGenSpeed:** Mínimo: `1` | Máximo: `4`
  * **PcieLaneCount:** Mínimo: `1` | Máximo: `8`
  * **Lclk (MHz):** Mínimo: `81` | Máximo: `619`

---

## 6. Curve (Curvas, Offsets e Parâmetros de Tensão)

* **StaticVoltageOffset (GHz->V):** GFX e SoC em `0.000000` (a, b, c)
* **Linear Droop (GHz)/(V):** GFX e SoC em `0.000000` (1 a 5)
* **DcBtc (mV):**
  * **GFX:** Habilitado | Min: `0` | Max: `56` | Gb: `6`
  * **SoC:** Habilitado | Min: `0` | Max: `56` | Gb: `6`
* **DcTol (mV):** GFX: `56` | SoC: `56`

---

## 7. Fan (Ventilação e Curva de Fans)

### Fan Table
* **PWM Minimum (%):** `10`
* **Acoustic Limit (RPM):** `1800`
* **Throttling (RPM):** `3600`
* **Maximum (RPM):** `3600`
* **Target Temperature (°C):** `90`
* **Target GFX Clock (MHz):** `500`
* **Zero RPM Enable:** `Habilitado`
* **Stop Temperature (°C):** `50`
* **Start Temperature (°C):** `60`

### Overdrive Fan Curve Limits & Acústica
* **Temperature (°C):** Mínimo: `25` | Máximo: `100`
* **Speed (%):** Mínimo: `10` | Máximo: `100`
* **Auto Fan Acoustic Limit:** `0`

---

## 8. More Settings (Limites Avançados, Curvas e Throttling)

### More Power Limits (Power Settings)
* **Power Limits (W):** PPT0: `120` | PPT1: `0` | PPT2: `0` | PPT3: `0`
* **Power Limits Tau (ms):** PPT0: `0` | PPT1: `0` | PPT2: `0` | PPT3: `0`
* **TDC Limits (A):** GFX: `120` | Soc: `22`
* **TDC Limits Tau (ms):** GFX: `0` | Soc: `0`

### More Curve Settings
* **PerPartDroopModelGfxDfl (GHz->V):**
  * **Ponto 1:** a = `1.009300`, b = `0.049800`, c = `-0.057160`
  * **Ponto 2:** a = `1.009300`, b = `0.049800`, c = `-0.057160`
  * **Ponto 3:** a = `1.009300`, b = `0.049800`, c = `-0.057160`
  * **Ponto 4:** a = `0.883260`, b = `0.114000`, c = `-0.091100`
  * **Ponto 5:** a = `0.651720`, b = `0.123000`, c = `0.176410`
* **PerPartDroopVsetGfxDfl (mV):**
  * 1: `750` | 2: `850` | 3: `950` | 4: `1050` | 5: `1200`
* **AVFS Override (GHz->V):** GFX e SoC desativados (`0.000000`)
* **BtcGb Override (GHz->V):**
  * **dBtcGbGfxPll:** a = `0.065400`, b = `-0.059000`, c = `0.092310`
  * **dBtcGbGfxDfl:** a = `0.000000`, b = `0.000000`, c = `0.000000`
  * **dBtcGbSoc:** a = `0.151540`, b = `0.037600`, c = `-0.016520`
* **AgingGb Override (GHz->V):** GFX e SoC em `0.000000`
* **VC BTC Parameters (mV / GHz->V):**
  * **Status:** Habilitado
  * **VminT0:** `725`
  * **FixedVminAgingOffset:** `13`
  * **Vmin2PsmDegrationGb:** `0`
  * **PsmA:** `3.085300` | **PsmB:** `0.227000`
  * **VminA:** `16.549999` | **VminB:** `0.398100`
* **Modelos e Seleção:**
  * **BtcGbGfx DFLL Model Select:** PerPart piece-wise linear
  * **GfxclkSource:** DFLL

### Throttler Settings (Controle de Proteção / Throttling)
* **Habilitados:**
  * [x] TEMP_HOTSPOT
  * [x] TEMP_MEM
  * [x] TDC_GFX
  * [x] TDC_SOC
  * [x] PPT0
* **Desabilitados:**
  * [ ] TEMP_EDGE
  * [ ] TEMP_VR_GFX
  * [ ] TEMP_VR_MEM0
  * [ ] TEMP_VR_MEM1
  * [ ] TEMP_VR_SOC
  * [ ] TEMP_LIQUID0
  * [ ] TEMP_LIQUID1
  * [ ] TEMP_PLX
  * [ ] PPT1
  * [ ] PPT2
  * [ ] PPT3
  * [ ] FIT
  * [ ] PPM
  * [ ] APCC
