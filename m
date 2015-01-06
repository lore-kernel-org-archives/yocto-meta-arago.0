Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7804752978
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 18:03:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06I32Ok018852
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:03:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06I32qV001930
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:03:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:03:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06I320k024524;
	Tue, 6 Jan 2015 12:03:02 -0600
Date: Tue, 6 Jan 2015 13:03:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150106180301.GR4759@edge>
References: <1420549486-9379-1-git-send-email-a0393906@ti.com>
	<1420549486-9379-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420549486-9379-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [WILINK R8.5 2/2] wl18xx, bt-firmware: Update to R8.5
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
X-List-Received-Date: Tue, 06 Jan 2015 18:03:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

You've dropped version from the filenames of all the WiLink components, but 
updated PV only in ti-compat-wireless. All other packages will go back to 0.0 
version due to missing PV. And since that version sorts lower, it won't be 
installed on top of the old version.

-- 
Denys


On Tue, Jan 06, 2015 at 06:34:46PM +0530, Karthik Ramanan wrote:
> Update tools, firmware and scripts to the R8.5 release
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    4 ++--
>  ...xx_r8.a9.14.bb => ti-compat-wireless-wl18xx.bb} |    6 +++---
>  ...8xx-firmware_r8.a9.14.bb => wl18xx-firmware.bb} |    6 +++---
>  ...-wl18xx_r8.a9.14.bb => hostap-daemon-wl18xx.bb} |    6 +++---
>  ...cripts_r8.a9.14.bb => wl18xx-target-scripts.bb} |    6 +++---
>  .../wlconf/{wlconf_r8.a9.14.bb => wlconf.bb}       |    6 +++---
>  ...wl18xx_r8.a9.14.bb => wpa-supplicant-wl18xx.bb} |    6 +++---
>  ...-wl18xx_r8.a9.14.bb => ti-wifi-utils-wl18xx.bb} |    6 +++---
>  8 files changed, 23 insertions(+), 23 deletions(-)
>  rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a9.14.bb => ti-compat-wireless-wl18xx.bb} (93%)
>  rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a9.14.bb => wl18xx-firmware.bb} (87%)
>  rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a9.14.bb => hostap-daemon-wl18xx.bb} (83%)
>  rename meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/{wl18xx-target-scripts_r8.a9.14.bb => wl18xx-target-scripts.bb} (85%)
>  rename meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a9.14.bb => wlconf.bb} (94%)
>  rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a9.14.bb => wpa-supplicant-wl18xx.bb} (88%)
>  rename meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a9.14.bb => ti-wifi-utils-wl18xx.bb} (89%)
> 
> diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> index 20db8da..f458b63 100644
> --- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> +++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> @@ -11,11 +11,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  RCONFLICTS_${PN} = "linux-firmware-wl12xx"
>  RREPLACES_${PN}  = "linux-firmware-wl12xx"
>  
> -PR = "r6+gitr${SRCPV}"
> +PR = "r7+gitr${SRCPV}"
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx-evm"
>  
> -SRCREV = "fbcab22449ce930a4192ffeb470c168f4e85e0c6"
> +SRCREV = "46f6a1d0087bd9aac6e6cbae58ed9ee236e5f1b1"
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/wilink8-bt/ti-bt-firmware.git;branch=${BRANCH} \
>             file://0001-Makefile-allow-building-within-the-OE.patch \
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
> similarity index 93%
> rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
> index fd1b914..b21fca4 100644
> --- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
> @@ -9,13 +9,13 @@ LIC_FILES_CHKSUM = "file://../backports/COPYING;md5=d7810fab7487fb0aad327b76f1be
>  
>  RDEPENDS_${PN} = "wireless-tools"
>  
> -PV = "r8.a9.14"
> +PV = "R8.5"
>  inherit module
>  
>  PR = "${MACHINE_KERNEL_PR}+e+gitr${SRCPV}"
>  
> -# Tags: ol_r8.a9.14
> -SRCREV_wl18xx = "3ccf4f9ff3fd5607f4d6e32fd84e2b3783532033"
> +# Tags: R8.5
> +SRCREV_wl18xx = "cb51164c672b1ecadef339b9f9b39e29ab706723"
>  BRANCH_wl18xx = "ap_p2p"
>  SRCREV_backports = "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
>  BRANCH_backports = "ap_dfs_mbss_all"
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
> similarity index 87%
> rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
> rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
> index 45d4ea7..586a293 100644
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
>  
>  PACKAGE_ARCH = "all"
>  
> -PR = "r4+gitr${SRCPV}"
> +PR = "r5+gitr${SRCPV}"
>  
>  PROVIDES += "wl12xx-firmware"
>  RPROVIDES_${PN} += "wl12xx-firmware"
>  RREPLACES_${PN} += "wl12xx-firmware"
>  RCONFLICTS_${PN} += "wl12xx-firmware"
>  
> -# Tag: ol_r8.a9.14
> -SRCREV = "2568d8f61fd509eabb112110c20ea31c088ef6b9"
> +# Tag: R8.5
> +SRCREV = "02df01f8b9557b2cf920d14bdaaabde2373e3d7e"
>  BRANCH = "ap_dfs"
>  SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
>             file://0001-Add-Makefile-for-SDK.patch \
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
> similarity index 83%
> rename from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
> rename to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
> index 3981b78..03de638 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
> @@ -14,9 +14,9 @@ FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
>  # of hostap
>  PV = "2.0-devel-ti"
>  
> -# Tag: ol_r8.a9.14
> -SRCREV = "281f5adb8eb7ee9e9220546c0227696b02aab332"
> -BRANCH = "single_hostap_dfs_dynamic"
> +# Tag: R8.5
> +SRCREV = "2710d0ae31fa2dc31f653f346a985268d8d7795c"
> +BRANCH = "ap_p2p"
>  
>  PROVIDES += "hostap-daemon"
>  RPROVIDES_${PN} += "hostap-daemon"
> diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
> similarity index 85%
> rename from meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> rename to meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
> index cdd8d16..504a6b8 100644
> --- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
>  
> -PR ="r4+gitr${SRCPV}"
> +PR ="r5+gitr${SRCPV}"
>  
> -# Tag: ol_r8.a9.14
> -SRCREV = "f6c66162e75c6a31fa7142530534e4df8f1a7bed"
> +# Tag: R8.5
> +SRCREV = "2d248d425e4d98ccda4db698e9df24443b7912c1"
>  BRANCH = "sitara-mbss"
>  SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
>  
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
> similarity index 94%
> rename from meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
> rename to meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
> index 02af7f6..4ce6bde 100644
> --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
>  
> -PR ="r2"
> +PR ="r3"
>  PR_append = "+gitr${SRCPV}"
>  
> -# Tag: ol_r8.a9.14
> -SRCREV = "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
> +# Tag: R8.5
> +SRCREV = "dcf0800f30ba449cd7f3a20f8b3f4853dc829652"
>  SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
>  
>  S = "${WORKDIR}/git/wlconf"
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
> similarity index 88%
> rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
> rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
> index 203364f..8e3c870 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
>  
>  FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
>  
> -# Tag: ol_r8.a9.14
> -SRCREV = "281f5adb8eb7ee9e9220546c0227696b02aab332"
> -BRANCH = "single_hostap_dfs_dynamic"
> +# Tag: R8.5
> +SRCREV = "2710d0ae31fa2dc31f653f346a985268d8d7795c"
> +BRANCH = "ap_p2p"
>  PR_append = "c+gitr${SRCPV}"
>  
>  # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
> similarity index 89%
> rename from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
> rename to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
> index f74c2f9..fe31b32 100644
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
>  DEPENDS = "libnl"
>  RDEPENDS_${PN} = "wl18xx-firmware"
>  
> -PR ="r2+gitr${SRCPV}"
> +PR ="r3+gitr${SRCPV}"
>  
> -#Tag: ol_r8.a9.14
> -SRCREV = "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
> +#Tag: R8.5
> +SRCREV = "dcf0800f30ba449cd7f3a20f8b3f4853dc829652"
>  SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
>  "
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

