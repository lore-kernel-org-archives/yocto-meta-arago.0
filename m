Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DAE8552986
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 17:56:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0KHuW1F031348
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 11:56:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KHuWvA008042
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 11:56:32 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 20 Jan 2014 11:56:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KHuVFx021361;
	Mon, 20 Jan 2014 11:56:32 -0600
Date: Mon, 20 Jan 2014 12:56:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20140120175631.GY12727@edge>
References: <CF956B779D819D41BBC043B7082161D547A9BC@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D547A9BC@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: FW: FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES
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
X-List-Received-Date: Mon, 20 Jan 2014 17:56:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Mrinmayee,

Neither of the external toolchains (arago or linaro) provide ldd script.

The "tools-sdk" feature you are trying to use comes from upstream OE/Yocto and 
it seems to want to install ldd.

But either way, if you want the development tools such as gcc, make, etc. to 
be packaged in the rootfs, you need those to be built for the target, as you 
can't re-use the external cross-toolchain, as those binaries are x86.

In Arago we don't directly support this "tools-sdk" feature and it was not 
tested therefore.

I would suggest creating your own packagegroup with necessary minimal set of 
packages like gcc, make, etc. and adding it to the rootfs image. I believe 
that's how MCSDK guys are doing it. We can unify it between the teams going 
forward...

Let me know if you have any questions. Thanks.

-- 
Denys


On Mon, Jan 20, 2014 at 05:44:25PM +0000, Hingolikar, Mrinmayee wrote:
> Hi all,
> 
> I have tried building an image with development tools using the following:
> 
> 1.      Add  “tools-sdk” in EXTRA_IMAGE_FEATURES
> 
> 2.      In the branding file, set preferred providers as:
> 
> PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arago-sdk-toolchain"
> 
> PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arago-sdk-toolchain"
> 
> PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arago-sdk-toolchain"
> 
> 3.      In the PATH variable, I include the path to the external linaro toolchain.
> 
> Still the same errors are seen:
> Collected errors:
> * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-sdk:
> *      ldd *
> * opkg_install_cmd: Cannot install package packagegroup-core-sdk.
> 
> Any pointers ?
> 
> Regards,
> Mrinmayee
> 
> 
> From: Srinivasan, Nageswari
> Sent: Wednesday, January 08, 2014 4:01 PM
> To: Denys Dmytriyenko; Hingolikar, Mrinmayee; meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Cc: R, Karthik
> Subject: RE: [meta-arago] FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES
> 
> 
> Denys,
> 
> Just to add on
> The issue of missing sources came up after rebasing epossdk patches to Dylan branch
> 
> Build Configuration:
> BB_VERSION        = "1.18.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "am437x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2013.12"
> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta-ti-secure    = "master:08f6b88d375b6ae71ac9a5ce92dc46c8458ba229"
> meta-arago-distro
> meta-arago-extras = "2013.12:2bd459897718bec6bc2cbc54549cefe38420bb68"
> meta-ti           = "2013.12:09d097123ff57532d826c734edef70a65ca70b22"
> meta-qt5          = "master:72ca958ebfb61640c614ec865196d68fba2576c2"
> toolchain-layer
> meta-networking
> meta-ruby
> meta-oe           = "dylan:44754206632dd5b0725aeb43e99e4ff9e0245dca"
> meta-linaro-toolchain = "dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc"
> meta              = "dylan:394fa61d00b97c19610bfb38f02174c4e8aeeb15"
> 
> 
> is there any additional change required on CREATE_SRCIPK for picking up the “*-src” into the packages.
> 
> Regards,
> Nageswari
> 
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Wednesday, January 08, 2014 10:43 AM
> To: Srinivasan, Nageswari; Hingolikar, Mrinmayee; meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Cc: R, Karthik
> Subject: Re: [meta-arago] FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES
> 
> "Srinivasan, Nageswari" <nageswari@ti.com<mailto:nageswari@ti.com>> wrote:
> Mrinmayee,
> 
> 
> I am also facing similar issues while building for EPOS SDK.
> 
> 
> Installing packagegroup-arago-tisdk-amsdk-sdk-host (1.0-r17) to root...
> | Downloading file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-amsdk-sdk-host_1.0-r17_am438x_epos_evm.ipk.
> | Installing packagegroup-arago-tisdk-epossdk-sdk-host (1.0-r1) to root...
> | Downloading file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-epossdk-sdk-host_1.0-r1_am438x_epos_evm.ipk.
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-addons-sdk-host:
> |  *    arm-benchmarks-src *    am-sysinfo-src *        ti-linux-secure-examples-src *  oprofile-example-src *
> |  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-addons-sdk-host.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-matrix-sdk-host:
> |  *    matrix-gui-src *
> |  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-matrix-sdk-host.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-amsdk-sdk-host:
> |  *    u-boot-am43xx-src *     linux-am43xx-src *      oe-layersetup-src *
> |  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-amsdk-sdk-host.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-epossdk-sdk-host:
> |  *    starterware-src *       examples-src *  ppa-am438x-epos-evm-src *
> |  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-epossdk-sdk-host.
> 
> 
> Regards,
> Nageswari
> 
> 
> 
> 
> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
> Sent: Wednesday, January 08, 2014 10:34 AM
> To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Cc: R, Karthik
> Subject: [meta-arago] FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES
> 
> 
> 
> 
> Hi all,
> 
> 
> I am trying to add development tools in the filesystem. After adding tools-sdk in EXTRA_IMAGE_FEATURES, the build failed in the rootfs task. Snapshot of the log:
> Collected errors:
> * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-sdk:
> *      ldd *
> * opkg_install_cmd: Cannot install package packagegroup-core-sdk.
> 
> 
> Ldd package provided by eglibc is not getting built.
> 
> 
> Similar errors was seen when I built arago-console-image with the arago-dylan-config.
> Is this a known issue and any pointers to resolve it?
> 
> 
> Regards,
> Mrinmayee
> 
> 
> 
> ________________________________
> 
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> It fails in the same place, but for a completely different reason - you are trying to install host-side packages into a target rootfs...
> 
> --
> Denys

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


