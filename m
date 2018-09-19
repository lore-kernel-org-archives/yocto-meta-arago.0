Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C112252A06
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 16:09:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JG9NMI078685
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373363;
	bh=pr2GGjCBW9oKKQKRl6IRefziBEHpQAS9m8abbfrJw5M=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=lv/ynirDk/GZHqG+CJf6J+pNI/V9wGQ1oIcLU8YYKmduw5yoasUj4k7dt3wpPrfs0
	AzWAezuArf6UZj3LnMKHntrEkgDHv3buwwTWpQRWvvfZfViHU1JURkCTw29d+ybgKr
	+FRaoZJfh/LAfTMfKr2jCpYe1H5DBNFr7QUk42Zc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JG9NUh032390
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:09:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:09:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:09:23 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JG9MdY020420;
	Wed, 19 Sep 2018 11:09:22 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1536867790-1768-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b450c850-41fb-9e92-affe-aefeec5b7158@ti.com>
Date: Wed, 19 Sep 2018 12:09:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536867790-1768-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH v2] u-boot-k3-r5: update SYSFW to 2018.08b
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
X-List-Received-Date: Wed, 19 Sep 2018 16:09:32 -0000
Content-Type: multipart/alternative;
	boundary="------------4AAC989A53CEE74A3B871B61"
Content-Language: en-US

--------------4AAC989A53CEE74A3B871B61
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/13/2018 3:43 PM, Denys Dmytriyenko wrote:
> Also install and deploy versioned SYSFW binary with short symlink.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - replace remaining 2 instances of sysfw.bin with ${SYSFW_BINARY}
>
>   .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb        | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> index 0ff5658..04476ae 100644
> --- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> +++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> @@ -7,10 +7,12 @@ PKG_${PN}-dbg = "${PN}-dbg"
>   
>   COMPATIBLE_MACHINE = "k3"
>   
> -SYSFW_VER = "2018.07a"
> -SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
> +SYSFW_VER = "2018.08b"
> +SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
> +SYSFW_BINARY = "sysfw.bin"
> +SYSFW_IMAGE = "sysfw-${SYSFW_VER}.bin"
>   
> -SRCREV_sysfw = "2035022224dcc885ac2cd0b11f8c76190f5af962"
> +SRCREV_sysfw = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
>   SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
>   SRCREV_FORMAT = "sysfw"
>   
> @@ -25,7 +27,7 @@ UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
>   
>   EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
>   EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> -EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/sysfw.bin'
> +EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/${SYSFW_BINARY}'
>   
>   UBOOT_BINARY = "tiboot3.bin"
>   UBOOT_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
> @@ -33,13 +35,16 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
>   SPL_BINARY_k3 = ""
>   
>   do_configure_append() {
> -	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
> +	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/${SYSFW_BINARY} -l 0x40000
>   }
>   
>   do_install_append() {
> -	install -m 644 ${WORKDIR}/sysfw.bin ${D}/boot/
> +	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
> +	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
>   }
>   
>   do_deploy_append() {
> -	install -m 644 ${WORKDIR}/sysfw.bin ${DEPLOYDIR}/
> +	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
> +	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
> +	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
>   }


--------------4AAC989A53CEE74A3B871B61
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/13/2018 3:43 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1536867790-1768-1-git-send-email-denys@ti.com">
      <pre wrap="">Also install and deploy versioned SYSFW binary with short symlink.

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
v2 - replace remaining 2 instances of sysfw.bin with ${SYSFW_BINARY}

 .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb        | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
index 0ff5658..04476ae 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
@@ -7,10 +7,12 @@ PKG_${PN}-dbg = "${PN}-dbg"
 
 COMPATIBLE_MACHINE = "k3"
 
-SYSFW_VER = "2018.07a"
-SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
+SYSFW_VER = "2018.08b"
+SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
+SYSFW_BINARY = "sysfw.bin"
+SYSFW_IMAGE = "sysfw-${SYSFW_VER}.bin"
 
-SRCREV_sysfw = "2035022224dcc885ac2cd0b11f8c76190f5af962"
+SRCREV_sysfw = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
 SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
 SRCREV_FORMAT = "sysfw"
 
@@ -25,7 +27,7 @@ UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
 
 EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/sysfw.bin'
+EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/${SYSFW_BINARY}'
 
 UBOOT_BINARY = "tiboot3.bin"
 UBOOT_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
@@ -33,13 +35,16 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
 SPL_BINARY_k3 = ""
 
 do_configure_append() {
-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
+	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/${SYSFW_BINARY} -l 0x40000
 }
 
 do_install_append() {
-	install -m 644 ${WORKDIR}/sysfw.bin ${D}/boot/
+	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
+	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
 }
 
 do_deploy_append() {
-	install -m 644 ${WORKDIR}/sysfw.bin ${DEPLOYDIR}/
+	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
+	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
 }
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4AAC989A53CEE74A3B871B61--
