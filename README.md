# RX6600M 51Risc TiNerl Docs

Repositório dedicado à documentação, configuração e experimentação da placa de vídeo RX6600M 51Risc Rev 1.0 com clocks e potência ajustáveis com o foco principal atingir o "sweet spot" estável para uso em jogos ou IA sem depender de configurações obscuras ou de gambiarras.

---

## Visão geral

Este projeto nasceu da necessidade de liberar o controle dos clocks de uma RX6600M que vinha com limites rígidos impostos pela AMD. A ideia central é registrar, organizar e compartilhar o processo de modificação, ajustes e testes usados para obter um melhor desempenho e menor consumo térmico.

O repositório reúne:

- arquivos de BIOS/perfil modificados;
- scripts para aplicar clocks em Linux;
- documentação do processo e dos objetivos;
- material para facilitar a reprodução em outros casos semelhantes.

---

## O que foi feito até agora?

Para atender à demanda de desempenho em jogos e modelos de IA, foi necessário substituir a BIOS padrão por uma variante semelhante que permitisse o controle dos clocks, algo que estava bloqueado pela configuração original da placa.

A partir dessa necessidade, foi criado este repositório para guardar os arquivos, ajustes e notas relacionadas ao processo, mantendo tudo em um único local organizado.

---

## Estrutura do repositório

### Arquivos principais

- `README.md` — documentação geral do projeto.
- `amdgpu-clocks.sh` — script em bash para aplicar configurações de clock e potência no Linux via sysfs do kernel AMDGPU.
- `RX6600M-51RISC-MOD-RX6600-SAPPHIRE-UNDERVOLT.mpt` — perfil/arquivo modificado relacionado a undervolt e ajuste de clocks.

---

## Script Linux: `amdgpu-clocks.sh`

O script foi montado para ativar a GPU a partir do estado de suspensão, forçar o modo manual de desempenho e aplicar valores de clock diretamente no driver AMDGPU.

### Funções principais

- acorda a GPU do estado de suspensão;
- habilita o modo manual;
- define limites para SCLK (clock do núcleo);
- define o valor de MCLK;
- aplica a configuração no driver;
- força o nível máximo de desempenho.

### Exemplo de configuração aplicada

```bash
# SCLK: mínimo 500MHz, máximo 2300MHz
echo "s 0 500" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null
echo "s 1 2300" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null

# MCLK: 1750MHz conforme o perfil
echo "m 1 1750" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null
```

### Importante

Os caminhos de PCI e de placa podem variar conforme o sistema. Em alguns computadores, `0000:03:00.0` e `card1` podem ser diferentes. Antes de executar, vale checar:

```bash
lspci | grep -i vga
ls /sys/class/drm
```

---

## Objetivos gerais

Planejo organizar e documentar as três principais variantes relevantes para o caso:

- RX6600M 51Risc rev 1.0;
- RX6600M 51Risc rev 2.0 (sem PWM da ventoinha);
- RX6600 Pulse da AMD/Sapphire (ATUAL);

Além disso, o projeto pretende detalhar no futuro:

- as configurações exatas usadas;
- os programas e ferramentas empregadas;
- os passos para reproduzir o processo em Windows ou Linux;
- uma referência mais simples para quem quiser aplicar os ajustes sem perder tempo.

---

## Resultado esperado

O objetivo final é criar um método claro e acessível para aplicar essas configurações nas plataformas citadas sem complicações desnecessárias.

Se esse material conseguir ajudar ao menos uma pessoa fico extremamente satisfeito.

---

## Avisos e cuidados

- este processo é experimental;
- risco de instabilidade, superaquecimento ou falha do hardware se as configurações excederem as configurações definidas aqui;
- ajuste de BIOS e clocks deve ser feito com cautela e paciência;
- sempre mantenha backups importantes e entenda o que está alterando antes de aplicar as mudanças.

---

## Status atual

Este repositório está em fase inicial de organização e documentação. A estrutura está sendo montada para preservar o conhecimento acumulado até o momento e facilitar futuras melhorias.
