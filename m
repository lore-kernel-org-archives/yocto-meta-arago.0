Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8B03F52A52
	for <meta-arago@arago-project.org>;
	Mon, 15 Jun 2020 19:45:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FJh7GB085050;
	Mon, 15 Jun 2020 14:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1592250187;
	bh=Jh20mjabRhj1PH8FSnCBbqMEtkW9ZRmZC2/FqWFpHDA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ddVbKhlITF3Rxwp7zg8oIWCDSZBTHc8M0OPEt3rT9PgwHn3NU0+T1HylhFQD9VY1q
	ATC3BEQpBSpTbmzGP2wttVYau9X2i2siG9qUSz3d/eD9BBUfrsG3qyaUz5vrLOgakB
	iJKCG3DvSosK5fGIj/Dj+UPyg7BbZ1NCxSeTLzMw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05FJh7N7024411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2020 14:43:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 15 Jun 2020 14:42:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 15 Jun 2020 14:42:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FJgqRj066829;
	Mon, 15 Jun 2020 14:42:52 -0500
Date: Mon, 15 Jun 2020 15:42:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Message-ID: <20200615194251.GC10991@beryl>
References: <20200611223129.58314-1-ankur.tyagi@gallagher.com>
	<SYXPR01MB1088B788FE7E2A6BC89E11F1E5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
	<SY3PR01MB08094675F22049EFC5885294E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SY3PR01MB08094675F22049EFC5885294E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dunfell/master PATCH] arago-source-ipk.inc: Use weak assignment to create source ipk file
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
X-List-Received-Date: Mon, 15 Jun 2020 19:45:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 15, 2020 at 07:41:37PM +0000, Ankur Tyagi wrote:
> Hi Denys,
> 
> Gentle reminder as this patch has been in mailing list for some time now 
> (http://arago-project.org/pipermail/meta-arago/2020-June/012694.html)
> And I haven't heard anything back.

And here:
http://arago-project.org/pipermail/meta-arago/2020-June/012693.html


> Regards
> Ankur
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-project.org> On Behalf Of Ankur Tyagi
> Sent: Friday, 12 June 2020 10:50 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [dunfell/master PATCH] arago-source-ipk.inc: Use weak assignment to create source ipk file
> 
> This is to allow user to override(disable) them in their configuration.
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  .../conf/distro/include/arago-source-ipk.inc  | 504 +++++++++---------
>  1 file changed, 252 insertions(+), 252 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> index c479a8c8..5ffdc982 100644
> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> @@ -40,371 +40,371 @@ INHERIT += "sourceipk"
>  SRCIPK_INCLUDE_EXTRAFILES = "0"
>  
>  # Set source ipk packages and install directories
> -CREATE_SRCIPK_pn-ti-tisdk-licenses = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses = "docs/licenses"
> +CREATE_SRCIPK_pn-ti-tisdk-licenses ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses ?= "docs/licenses"
>  
> -CREATE_SRCIPK_pn-matrix-gui = "1"
> -SRCIPK_INSTALL_DIR_pn-matrix-gui = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-matrix-gui ?= "1"
> +SRCIPK_INSTALL_DIR_pn-matrix-gui ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-crypto-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-crypto-examples = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-crypto-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-crypto-examples ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-qml-carinfo = "1"
> -SRCIPK_INSTALL_DIR_pn-qml-carinfo = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qml-carinfo ?= "1"
> +SRCIPK_INSTALL_DIR_pn-qml-carinfo ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-quick-playground = "1"
> -SRCIPK_INSTALL_DIR_pn-quick-playground = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-quick-playground ?= "1"
> +SRCIPK_INSTALL_DIR_pn-quick-playground ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-qt-catalog = "1"
> -SRCIPK_INSTALL_DIR_pn-qt-catalog = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-catalog ?= "1"
> +SRCIPK_INSTALL_DIR_pn-qt-catalog ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-qt-patientcare = "1"
> -SRCIPK_INSTALL_DIR_pn-qt-patientcare = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-patientcare ?= "1"
> +SRCIPK_INSTALL_DIR_pn-qt-patientcare ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-qt-tstat = "1"
> -SRCIPK_INSTALL_DIR_pn-qt-tstat = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-tstat ?= "1"
> +SRCIPK_INSTALL_DIR_pn-qt-tstat ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-dual-camera-demo = "1"
> -SRCIPK_INSTALL_DIR_pn-dual-camera-demo = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-dual-camera-demo ?= "1"
> +SRCIPK_INSTALL_DIR_pn-dual-camera-demo ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-evse-hmi = "1"
> -SRCIPK_INSTALL_DIR_pn-evse-hmi = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-evse-hmi ?= "1"
> +SRCIPK_INSTALL_DIR_pn-evse-hmi ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-protection-relays-hmi = "1"
> -SRCIPK_INSTALL_DIR_pn-protection-relays-hmi = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-protection-relays-hmi ?= "1"
> +SRCIPK_INSTALL_DIR_pn-protection-relays-hmi ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-mmwavegesture-hmi = "1"
> -SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-mmwavegesture-hmi ?= "1"
> +SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-pdm-anomaly-detection = "1"
> -SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-pdm-anomaly-detection ?= "1"
> +SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-tiovx-app-host = "1"
> -SRCIPK_INSTALL_DIR_pn-tiovx-app-host = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-tiovx-app-host ?= "1"
> +SRCIPK_INSTALL_DIR_pn-tiovx-app-host ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-image-gallery = "1"
> -SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
> +CREATE_SRCIPK_pn-image-gallery ?= "1"
> +SRCIPK_INSTALL_DIR_pn-image-gallery ?= "example-applications/${PN}"
>  
> -CREATE_SRCIPK_pn-matrix-gui-browser = "1"
> -SRCIPK_INSTALL_DIR_pn-matrix-gui-browser = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-matrix-gui-browser ?= "1"
> +SRCIPK_INSTALL_DIR_pn-matrix-gui-browser ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-refresh-screen = "1"
> -SRCIPK_INSTALL_DIR_pn-refresh-screen = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-refresh-screen ?= "1"
> +SRCIPK_INSTALL_DIR_pn-refresh-screen ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-am-sysinfo = "1"
> -SRCIPK_INSTALL_DIR_pn-am-sysinfo = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-am-sysinfo ?= "1"
> +SRCIPK_INSTALL_DIR_pn-am-sysinfo ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-oprofile-example = "1"
> -SRCIPK_INSTALL_DIR_pn-oprofile-example = "example-applications/${PN}"
> +CREATE_SRCIPK_pn-oprofile-example ?= "1"
> +SRCIPK_INSTALL_DIR_pn-oprofile-example ?= "example-applications/${PN}"
>  
> -CREATE_SRCIPK_pn-arm-benchmarks = "1"
> -SRCIPK_INSTALL_DIR_pn-arm-benchmarks = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-arm-benchmarks ?= "1"
> +SRCIPK_INSTALL_DIR_pn-arm-benchmarks ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-omapconf = "1"
> -SRCIPK_INSTALL_DIR_pn-omapconf = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-omapconf ?= "1"
> +SRCIPK_INSTALL_DIR_pn-omapconf ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-pru-sw-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples = "example-applications/pru-${PV}"
> +CREATE_SRCIPK_pn-ti-pru-sw-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?= "example-applications/pru-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-ocf-crypto-module = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-ocf-crypto-module ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-omap3-sgx-modules = "1"
> -SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules = "board-support/extra-drivers/sgx-modules-${PV}"
> +CREATE_SRCIPK_pn-omap3-sgx-modules ?= "1"
> +SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules ?= "board-support/extra-drivers/sgx-modules-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-wl18xx-fw = "1"
> -SRCIPK_INSTALL_DIR_pn-wl18xx-fw = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-wl18xx-fw ?= "1"
> +SRCIPK_INSTALL_DIR_pn-wl18xx-fw ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-wl1271-wlan-cli = "1"
> -SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli = "example-applications/wlan"
> +CREATE_SRCIPK_pn-wl1271-wlan-cli ?= "1"
> +SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli ?= "example-applications/wlan"
>  
> -CREATE_SRCIPK_pn-av-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-av-examples = "example-applications/av-examples-${PV}"
> +CREATE_SRCIPK_pn-av-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-av-examples ?= "example-applications/av-examples-${PV}"
>  
> -CREATE_SRCIPK_pn-u-boot = "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot = "board-support/u-boot-${PV}"
> +CREATE_SRCIPK_pn-u-boot ?= "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot ?= "board-support/u-boot-${PV}"
>  # For beagleboard we use the git version which doesn't define UVER
> -SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard = "board-support/${P}"
> +SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard ?= "board-support/${P}"
>  
> -CREATE_SRCIPK_pn-x-load = "1"
> -SRCIPK_INSTALL_DIR_pn-x-load = "board-support/x-load-${XVER}-psp${PSPREL}"
> +CREATE_SRCIPK_pn-x-load ?= "1"
> +SRCIPK_INSTALL_DIR_pn-x-load ?= "board-support/x-load-${XVER}-psp${PSPREL}"
>  # For beagleboard we use the git version which doesn't define XVER
> -SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
> +SRCIPK_INSTALL_DIR_pn-x-load_beagleboard ?= "board-support/${P}"
>  
> -CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}${UBOOT_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
> +CREATE_SRCIPK_pn-u-boot-ti-staging ?= "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?= "board-support/u-boot-${PV}${UBOOT_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?= "true"
>  
> -CREATE_SRCIPK_pn-u-boot-keystone = "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-keystone = "board-support/u-boot-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
> +CREATE_SRCIPK_pn-u-boot-keystone ?= "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot-keystone ?= "board-support/u-boot-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-u-boot-keystone ?= "true"
>  
> -CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
> +CREATE_SRCIPK_pn-u-boot-dra7xx ?= "1"
> +SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?= "board-support/u-boot-${PV}-${PR}"
>  
> -CREATE_SRCIPK_pn-arm-trusted-firmware = "1"
> -SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware = "board-support/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware = "true"
> +CREATE_SRCIPK_pn-arm-trusted-firmware ?= "1"
> +SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware ?= "board-support/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware ?= "true"
>  
> -CREATE_SRCIPK_pn-linux-ti-staging = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
> -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
> +CREATE_SRCIPK_pn-linux-ti-staging ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging ?= "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging ?= "true"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging ?= "true"
>  
> -CREATE_SRCIPK_pn-linux-ti-staging-rt = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt = "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt = "true"
> -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt = "true"
> +CREATE_SRCIPK_pn-linux-ti-staging-rt ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt ?= "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt ?= "true"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt ?= "true"
>  
> -CREATE_SRCIPK_pn-linux-ti-staging-systest = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest = "board-support/linux-systest-${PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest = "true"
> -SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest = "true"
> +CREATE_SRCIPK_pn-linux-ti-staging-systest ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest ?= "board-support/linux-systest-${PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest ?= "true"
> +SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest ?= "true"
>  
> -CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
> -SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
> -SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
> -SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging = "true"
> -SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging = "400"
> +CREATE_SRCIPK_pn-sitara-linux-ti-staging ?= "1"
> +SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging ?= "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
> +SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging ?= "true"
> +SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging ?= "true"
> +SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging ?= "400"
>  
> -CREATE_SRCIPK_pn-linux-keystone = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-linux-keystone = "true"
> +CREATE_SRCIPK_pn-linux-keystone ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-keystone ?= "board-support/linux-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-linux-keystone ?= "true"
>  
> -CREATE_SRCIPK_pn-linux-am335x-psp = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-am335x-psp = "board-support/linux-${KVER}"
> +CREATE_SRCIPK_pn-linux-am335x-psp ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?= "board-support/linux-${KVER}"
>  
> -CREATE_SRCIPK_pn-linux-omap = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-omap = "board-support/linux-${PV}-${PR}"
> +CREATE_SRCIPK_pn-linux-omap ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-omap ?= "board-support/linux-${PV}-${PR}"
>  
> -CREATE_SRCIPK_pn-linux = "1"
> -SRCIPK_INSTALL_DIR_pn-linux = "board-support/linux-${PV}"
> +CREATE_SRCIPK_pn-linux ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux ?= "board-support/linux-${PV}"
>  
> -CREATE_SRCIPK_pn-linux-omap4 = "1"
> -SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
> +CREATE_SRCIPK_pn-linux-omap4 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linux-omap4 ?= "board-support/linux-${PV}"
>  
> -CREATE_SRCIPK_pn-cryptodev-module = "1"
> -SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-cryptodev-module = "true"
> +CREATE_SRCIPK_pn-cryptodev-module ?= "1"
> +SRCIPK_INSTALL_DIR_pn-cryptodev-module ?= "board-support/extra-drivers/cryptodev-module-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-cryptodev-module ?= "true"
>  
> -CREATE_SRCIPK_pn-cmem-mod = "1"
> -SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-cmem-mod ?= "1"
> +SRCIPK_INSTALL_DIR_pn-cmem-mod ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-debugss-module-drv = "1"
> -SRCIPK_INSTALL_DIR_pn-debugss-module-drv = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-debugss-module-drv ?= "1"
> +SRCIPK_INSTALL_DIR_pn-debugss-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-gdbserverproxy-module-drv = "1"
> -SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-gdbserverproxy-module-drv ?= "1"
> +SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-sgx-ddk-km = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-sgx-ddk-km ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-img-rogue-driver = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver = "board-support/extra-drivers/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver = "true"
> +CREATE_SRCIPK_pn-ti-img-rogue-driver ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver ?= "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver ?= "true"
>  
> -CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
> +CREATE_SRCIPK_pn-ti-img-encode-decode ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode ?= "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode ?= "true"
>  
> -CREATE_SRCIPK_pn-ti-gc320-driver = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ti-gc320-driver ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-gc320-driver ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
> +CREATE_SRCIPK_pn-ti-linux-driver-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?= "example-applications/linux-driver-examples-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl = "example-applications/linux-driver-examples-${PV}"
> +CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?= "example-applications/linux-driver-examples-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 = "example-applications/linux-driver-examples-${PV}"
> +CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 ?= "example-applications/linux-driver-examples-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-framework-components = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-framework-components = "component-sources/framework_components_${PV}"
> +CREATE_SRCIPK_pn-ti-framework-components ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-framework-components ?= "component-sources/framework_components_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codec-engine = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codec-engine = "component-sources/codec_engine_${PV}"
> +CREATE_SRCIPK_pn-ti-codec-engine ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?= "component-sources/codec_engine_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-omap3530 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 = "codecs-omap3530_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-omap3530 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 ?= "codecs-omap3530_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-linuxutils = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-linuxutils = "component-sources/linuxutils_${PV}"
> +CREATE_SRCIPK_pn-ti-linuxutils ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?= "component-sources/linuxutils_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-xdctools = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-xdctools = "component-sources/xdctools_${PV}"
> +CREATE_SRCIPK_pn-ti-xdctools ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-xdctools ?= "component-sources/xdctools_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dmai = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dmai = "dmai_${PV}"
> +CREATE_SRCIPK_pn-ti-dmai ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dmai ?= "dmai_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-xdais = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-xdais = "component-sources/xdais_${PV}"
> +CREATE_SRCIPK_pn-ti-xdais ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-xdais ?= "component-sources/xdais_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-local-power-manager = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-local-power-manager = "local-power-manager_${PV}"
> +CREATE_SRCIPK_pn-ti-local-power-manager ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-local-power-manager ?= "local-power-manager_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-dm355 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 = "codecs-dm355_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm355 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 ?= "codecs-dm355_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dvsdk-demos = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos = "dvsdk-demos_${PV}"
> +CREATE_SRCIPK_pn-ti-dvsdk-demos ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos ?= "dvsdk-demos_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dvtb = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dvtb = "dvtb_${PV}"
> +CREATE_SRCIPK_pn-ti-dvtb ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dvtb ?= "dvtb_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-dm365 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 = "codecs-dm365_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm365 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 ?= "codecs-dm365_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dm365mm-module = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module = "dm365mm-module_${PV}"
> +CREATE_SRCIPK_pn-ti-dm365mm-module ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module ?= "dm365mm-module_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-dm6446 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 = "codecs-dm6446_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm6446 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 ?= "codecs-dm6446_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-dm6467 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 = "codecs-dm6467_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-dm6467 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 ?= "codecs-dm6467_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-omapl137 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 = "codecs-omapl137_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-omapl137 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 ?= "codecs-omapl137_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-codecs-omapl138 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 = "codecs-omapl138_${PV}"
> +CREATE_SRCIPK_pn-ti-codecs-omapl138 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 ?= "codecs-omapl138_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-cgt6x = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-cgt6x = "dsp-devkit/cgt6x_${PV}"
> +CREATE_SRCIPK_pn-ti-cgt6x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-cgt6x ?= "dsp-devkit/cgt6x_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-cgt470 = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-cgt470 = "media-controller-devkit/cgt470_${PV}"
> +CREATE_SRCIPK_pn-ti-cgt470 ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-cgt470 ?= "media-controller-devkit/cgt470_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dspbios = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dspbios = "dspbios_${PV}"
> +CREATE_SRCIPK_pn-ti-dspbios ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dspbios ?= "dspbios_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-sysbios = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-sysbios = "component-sources/bios_${PV}"
> +CREATE_SRCIPK_pn-ti-sysbios ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-sysbios ?= "component-sources/bios_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-biosutils = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-biosutils = "biosutils_${PV}"
> +CREATE_SRCIPK_pn-ti-biosutils ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-biosutils ?= "biosutils_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dsplink = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dsplink = "dsplink_${PV}"
> +CREATE_SRCIPK_pn-ti-dsplink ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dsplink ?= "dsplink_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-syslink = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-syslink = "component-sources/syslink_${PV}"
> +CREATE_SRCIPK_pn-ti-syslink ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-syslink ?= "component-sources/syslink_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-edma3lld = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-edma3lld = "component-sources/edma3lld_${PV}"
> +CREATE_SRCIPK_pn-ti-edma3lld ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-edma3lld ?= "component-sources/edma3lld_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-c6accel = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-c6accel = "component-sources/c6accel_${PV}"
> +CREATE_SRCIPK_pn-ti-c6accel ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-c6accel ?= "component-sources/c6accel_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-biospsp = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-biospsp = "biospsp_${PV}"
> +CREATE_SRCIPK_pn-ti-biospsp ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-biospsp ?= "biospsp_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-audio-soc-example = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example = "audio-soc-example_${PV}"
> +CREATE_SRCIPK_pn-ti-audio-soc-example ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example ?= "audio-soc-example_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-c6run = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-c6run = "component-sources/c6run_${PV}"
> +CREATE_SRCIPK_pn-ti-c6run ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-c6run ?= "component-sources/c6run_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-osal = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-osal = "component-sources/osal_${PV}"
> +CREATE_SRCIPK_pn-ti-osal ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-osal ?= "component-sources/osal_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-ipc = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-ipc = "component-sources/ipc_${PV}"
> +CREATE_SRCIPK_pn-ti-ipc ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-ipc ?= "component-sources/ipc_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-dsp-benchmark = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark = "example-applications/dsp-benchmark_${PV}"
> +CREATE_SRCIPK_pn-ti-dsp-benchmark ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark ?= "example-applications/dsp-benchmark_${PV}"
>  
> -CREATE_SRCIPK_pn-gstreamer-ti = "1"
> -SRCIPK_INSTALL_DIR_pn-gstreamer-ti = "gstreamer-ti_${PV}"
> +CREATE_SRCIPK_pn-gstreamer-ti ?= "1"
> +SRCIPK_INSTALL_DIR_pn-gstreamer-ti ?= "gstreamer-ti_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-omx = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-omx = "component-sources/omx_${PV}"
> +CREATE_SRCIPK_pn-ti-omx ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-omx ?= "component-sources/omx_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-uia = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-uia = "component-sources/uia_${PV}"
> +CREATE_SRCIPK_pn-ti-uia ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-uia ?= "component-sources/uia_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-media-controller-utils = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils = "board-support/media-controller-utils_${PV}"
> +CREATE_SRCIPK_pn-ti-media-controller-utils ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils ?= "board-support/media-controller-utils_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-firmware-dm816x = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x = "board-support/prebuilt-images/dm816x-firmware_${PV}"
> +CREATE_SRCIPK_pn-ti-firmware-dm816x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x ?= "board-support/prebuilt-images/dm816x-firmware_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-firmware-dm814x = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x = "board-support/prebuilt-images/dm814x-firmware_${PV}"
> +CREATE_SRCIPK_pn-ti-firmware-dm814x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x ?= "board-support/prebuilt-images/dm814x-firmware_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-slog = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-slog = "component-sources/slog_${PV}"
> +CREATE_SRCIPK_pn-ti-slog ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-slog ?= "component-sources/slog_${PV}"
>  
> -CREATE_SRCIPK_pn-ti-c674x-aaclcdec = "1"
> -SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV}"
> +CREATE_SRCIPK_pn-ti-c674x-aaclcdec ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec ?= "component-sources/c674x-aaclcdec_${PV}"
>  
> -CREATE_SRCIPK_pn-oe-layersetup = "1"
> -SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
> +CREATE_SRCIPK_pn-oe-layersetup ?= "1"
> +SRCIPK_INSTALL_DIR_pn-oe-layersetup ?= "bin/oe-layersetup"
>  
> -CREATE_SRCIPK_pn-opencl-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-opencl-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-opencl-examples ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-openmpacc-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-openmpacc-examples = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-openmpacc-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-openmpacc-examples ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-tidl-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-tidl-examples = "example-applications/${PN}-${PV}"
> -SRCIPK_SRC_DIR_pn-tidl-examples = "${S}/examples"
> +CREATE_SRCIPK_pn-tidl-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-tidl-examples ?= "example-applications/${PN}-${PV}"
> +SRCIPK_SRC_DIR_pn-tidl-examples ?= "${S}/examples"
>  
> -CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded = "1"
> -SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded ?= "1"
> +SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-libarch-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-libarch-examples = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-libarch-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-libarch-examples ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-linalg-examples = "1"
> -SRCIPK_INSTALL_DIR_pn-linalg-examples = "example-applications/${PN}-${PV}"
> -SRCIPK_SRC_DIR_pn-linalg-examples = "${EXAMPLES_ROOT}"
> +CREATE_SRCIPK_pn-linalg-examples ?= "1"
> +SRCIPK_INSTALL_DIR_pn-linalg-examples ?= "example-applications/${PN}-${PV}"
> +SRCIPK_SRC_DIR_pn-linalg-examples ?= "${EXAMPLES_ROOT}"
>  
> -CREATE_SRCIPK_pn-barcode-roi = "1"
> -SRCIPK_INSTALL_DIR_pn-barcode-roi = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-barcode-roi ?= "1"
> +SRCIPK_INSTALL_DIR_pn-barcode-roi ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-boot-monitor = "1"
> -SRCIPK_INSTALL_DIR_pn-boot-monitor = "board-support/${PN}-${PV}"
> +CREATE_SRCIPK_pn-boot-monitor ?= "1"
> +SRCIPK_INSTALL_DIR_pn-boot-monitor ?= "board-support/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-hplib-mod = "1"
> -SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-hplib-mod ?= "1"
> +SRCIPK_INSTALL_DIR_pn-hplib-mod ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-uio-module-drv = "1"
> -SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-uio-module-drv ?= "1"
> +SRCIPK_INSTALL_DIR_pn-uio-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
> -SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
> -SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
> +CREATE_SRCIPK_pn-ivshmem-uio-driver ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver ?= "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver ?= "true"
>  
> -CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
> -SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-ipsecmgr-mod ?= "1"
> +SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?= "board-support/extra-drivers/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-pru-icss = "1"
> -SRCIPK_INSTALL_DIR_pn-pru-icss = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-pru-icss ?= "1"
> +SRCIPK_INSTALL_DIR_pn-pru-icss ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-dsplib-c66x = "1"
> -SRCIPK_INSTALL_DIR_pn-dsplib-c66x = "component-sources/dsplib_c66x_${PV}"
> +CREATE_SRCIPK_pn-dsplib-c66x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-dsplib-c66x ?= "component-sources/dsplib_c66x_${PV}"
>  
> -CREATE_SRCIPK_pn-mathlib-c66x = "1"
> -SRCIPK_INSTALL_DIR_pn-mathlib-c66x = "component-sources/mathlib_c66x_${PV}"
> +CREATE_SRCIPK_pn-mathlib-c66x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-mathlib-c66x ?= "component-sources/mathlib_c66x_${PV}"
>  
> -CREATE_SRCIPK_pn-imglib-c66x = "1"
> -SRCIPK_INSTALL_DIR_pn-imglib-c66x = "component-sources/imglib_c66x_${PV}"
> +CREATE_SRCIPK_pn-imglib-c66x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-imglib-c66x ?= "component-sources/imglib_c66x_${PV}"
>  
> -CREATE_SRCIPK_pn-vlib-c66x = "1"
> -SRCIPK_INSTALL_DIR_pn-vlib-c66x = "component-sources/vlib_c66x_${PV}"
> +CREATE_SRCIPK_pn-vlib-c66x ?= "1"
> +SRCIPK_INSTALL_DIR_pn-vlib-c66x ?= "component-sources/vlib_c66x_${PV}"
>  
> -CREATE_SRCIPK_pn-big-data-ipc-demo-linux = "1"
> -SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux = "example-applications/${PN}-${PV}"
> +CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?= "1"
> +SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?= "example-applications/${PN}-${PV}"
>  
> -CREATE_SRCIPK_pn-ti-sci-fw_k3 = "1"
> -SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 = "${WORKDIR}/imggen"
> -SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 = "board-support/system-firmware-image-gen-${PV}"
> +CREATE_SRCIPK_pn-ti-sci-fw_k3 ?= "1"
> +SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 ?= "${WORKDIR}/imggen"
> +SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 ?= "board-support/system-firmware-image-gen-${PV}"
>  
> -CREATE_SRCIPK_pn-jailhouse = "1"
> -SRCIPK_INSTALL_DIR_pn-jailhouse = "board-support/extra-drivers/${PN}-${PV}"
> +CREATE_SRCIPK_pn-jailhouse ?= "1"
> +SRCIPK_INSTALL_DIR_pn-jailhouse ?= "board-support/extra-drivers/${PN}-${PV}"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

