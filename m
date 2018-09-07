Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B3DB952A3A
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 15:50:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87FoQYw055777
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 10:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536335426;
	bh=8djqGZ98jTyGPl3+R31dSlHTKfzTJjimZuMSkVeicaI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DYUAcFfzXNmSwZRVxaUSaZmglM8ECSn3sUOYqPm5VtPFDTfH0stF2BFVBhX6AVMFf
	Dqljochnzk8AGaRCwna8TABbeMoM8uNHrij8fjqa+4zgRIXa+GhS87aIX6rDLqKpoF
	yiD9JjgxDwnGUAU7tjwdibU/JY9s8fpENe/HfjYI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87FoQ3v005507
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 10:50:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 10:50:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 10:50:26 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87FoPIT022962;
	Fri, 7 Sep 2018 10:50:26 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1536331321-27946-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <551d531c-9e61-42d2-129f-e762a299959f@ti.com>
Date: Fri, 7 Sep 2018 11:50:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536331321-27946-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 3/5] [PATCH v2] linux-processor-sdk-4.14.inc: add device tree file for pru-adc demo
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2018 15:50:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/7/2018 10:42 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> v2 change: add "am335x-boneblack-pru-adc.dtb" to KERNEL_DEVICETREE
>
>   .../linux/files/ti33x/am335x-pru-adc.dtsi          | 68 ++++++++++++++++++++++
>   recipes-kernel/linux/linux-processor-sdk-4.14.inc  | 20 ++++++-
>   2 files changed, 87 insertions(+), 1 deletion(-)
>   create mode 100644 recipes-kernel/linux/files/ti33x/am335x-pru-adc.dtsi
>
> diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-adc.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-adc.dtsi
> new file mode 100644
> index 0000000..b50c106
> --- /dev/null
> +++ b/recipes-kernel/linux/files/ti33x/am335x-pru-adc.dtsi
> @@ -0,0 +1,68 @@
> +&am33xx_pinmux {
> +        pru_adc_bone_pins: pru_adc_bone_pins {
> +                pinctrl-single,pins = <
> +                        0x0a0 0x2e /* MISO_1, lcd_data0,       MUX_MODE6 | INPUT,  P8.45, PRU1[0]  GPI/GPO */
> +                        0x0a4 0x2e /* MISO_2, lcd_data1,       MUX_MODE6 | INPUT,  P8.46, PRU1[1]  GPI/GPO */
> +                        0x0a8 0x2e /* MISO_3, lcd_data2,       MUX_MODE6 | INPUT,  P8.43, PRU1[2]  GPI/GPO */
> +                        0x0ac 0x2e /* MISO_4, lcd_data3,       MUX_MODE6 | INPUT,  P8.44, PRU1[3]  GPI/GPO */
> +                        0x0b0 0x2e /* MISO_5, lcd_data4,       MUX_MODE6 | INPUT,  P8.41, PRU1[4]  GPI/GPO */
> +                        0x0b4 0x2e /* MISO_6, lcd_data5,       MUX_MODE6 | INPUT,  P8.42, PRU1[5]  GPI/GPO */
> +                        0x0b8 0x05 /* CS_12, lcd_data6,        MUX_MODE5 | OUTPUT, P8.39, PRU1[6]  GPI/GPO */
> +                        0x0bc 0x05 /* MOSI_1, lcd_data7,       MUX_MODE5 | OUTPUT, P8.40, PRU1[7]  GPI/GPO */
> +                        0x0e0 0x05 /* MOSI_2, lcd_vsync,       MUX_MODE5 | OUTPUT, P8.27, PRU1[8]  GPI/GPO */
> +                        0x0e4 0x05 /* MOSI_3, lcd_hsync,       MUX_MODE5 | OUTPUT, P8.29, PRU1[9]  GPI/GPO */
> +                        0x0e8 0x05 /* MOSI_4, lcd_pclk,        MUX_MODE5 | OUTPUT, P8.28, PRU1[10] GPI/GPO */
> +                        0x0ec 0x05 /* MOSI_5, lcd_ac_bias_en,  MUX_MODE5 | OUTPUT, P8.30, PRU1[11] GPI/GPO */
> +                        0x080 0x05 /* MOSI_6, gpmc_csn1,       MUX_MODE5 | OUTPUT, P8.21, PRU1[12] GPI/GPO */
> +                        0x084 0x05 /* SCLK_OUT, gpmc_csn2,     MUX_MODE5 | OUTPUT, P8.20, PRU1[13] GPI/GPO */
> +                        0x038 0x07 /* OE, GPIO1_14,            MUX_MODE7 | OUTPUT, P8.16, GPIO1_14 GPIO */
> +                >;
> +        };
> +};
> +
> +&pruss {
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pru_adc_bone_pins>;
> +};
> +
> +/* Reserve 256kB DDR memory for the ping/pong buffers */
> +/{
> +        reserved-memory {
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +                ranges;
> +
> +                pruadc_reserved: pruadc_reserved@0x9ffc0000 {
> +                        reg = <0x9ffc0000 0x00040000>;
> +                        no-map;
> +                        status = "okay";
> +                };
> +        };
> +
> +        hdmi {
> +                status = "disabled";
> +        };
> +};
> +
> +/* Disable the following nodes due to pin mux conflicts with PRU signals needed */
> +&tda19988 {
> +        status = "disabled";
> +};
> +
> +&lcdc {
> +        status = "disabled";
> +};
> +
> +&mcasp0 {
> +        status = "disabled";
> +};
> +
> +&mmc2 {
> +        status = "disabled";
> +};
> +
> +/{
> +        sound {
> +                status = "disabled";
> +        };
> +};
> diff --git a/recipes-kernel/linux/linux-processor-sdk-4.14.inc b/recipes-kernel/linux/linux-processor-sdk-4.14.inc
> index de8950b..4958551 100644
> --- a/recipes-kernel/linux/linux-processor-sdk-4.14.inc
> +++ b/recipes-kernel/linux/linux-processor-sdk-4.14.inc
> @@ -1,4 +1,4 @@
> -PR_append = ".tisdk0"
> +PR_append = ".tisdk1"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:${THISDIR}/files:"
>   
> @@ -6,6 +6,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:${THISDIR}/files:"
>   
>   SRC_URI_append = " file://jailhouse.cfg"
>   
> +SRC_URI_append_ti33x = " file://am335x-pru-adc.dtsi"
> +
>   KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"
>   
>   AM57XX_KERNEL_DEVICETREE = " \
> @@ -20,6 +22,22 @@ AM57XX_KERNEL_DEVICETREE = " \
>       am574x-idk-pps.dtb \
>   "
>   
> +do_setup_adc() {
> +:
> +}
> +
> +do_setup_adc_ti33x() {
> +    dts="am335x-boneblack-pru-adc.dts"
> +    dtsi="am335x-pru-adc.dtsi"
> +    cp ${S}/arch/arm/boot/dts/am335x-boneblack.dts ${S}/arch/arm/boot/dts/$dts
> +    cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
> +    echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
> +}
> +
> +do_patch[postfuncs] += "do_setup_adc"
> +
> +KERNEL_DEVICETREE_append_ti33x = "am335x-boneblack-pru-adc.dtb"

There needs to be a space.

> +
>   KERNEL_DEVICETREE_append_am57xx-evm = " ${AM57XX_KERNEL_DEVICETREE}"
>   KERNEL_DEVICETREE_append_am57xx-hs-evm = " ${AM57XX_KERNEL_DEVICETREE}"
>   


