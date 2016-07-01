Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 31A8452A4F
	for <meta-arago@arago-project.org>;
	Fri,  1 Jul 2016 20:25:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u61KNtPq007841
	for <meta-arago@arago-project.org>; Fri, 1 Jul 2016 15:23:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u61KPCqk019755
	for <meta-arago@arago-project.org>; Fri, 1 Jul 2016 15:25:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 1 Jul 2016 15:25:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u61KPBbv014894;
	Fri, 1 Jul 2016 15:25:11 -0500
Date: Fri, 1 Jul 2016 16:25:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>
Message-ID: <20160701202510.GE29380@edge>
References: <598159108.2270.1467356231058.JavaMail.root@jenkins06.india.ti.com>
	<1373719829.2273.1467363432099.JavaMail.root@jenkins06.india.ti.com>
	<05CF4794C98B244ABDC620C10903762275BAAE23@DBDE04.ent.ti.com>
	<24B88602B5904F49971CAF899152529B37824674@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <24B88602B5904F49971CAF899152529B37824674@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Build failed in Jenkins: GLSDK_Nightly_Build_Krogoth #608
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
X-List-Received-Date: Fri, 01 Jul 2016 20:25:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

FYI. Please also see the RFC patch I sent earlier to meta-ti and comment if 
it's correct. Thanks.

-- 
Denys


On Fri, Jul 01, 2016 at 01:53:32PM -0400, R, Karthik wrote:
> Hi All,
> 
> The following commit is breaking builds since the last two days for dra7xx-evm
> bece406e7ac5bc068d08ea331f342b7fb0dc56e0: packagegroup-arago-tisdk-addons:   Add uio-module-drv and related test code
> 
> Regards
> Karthik
> 
> -----Original Message-----
> From: jenkins-swcoe@ti.com [mailto:jenkins-swcoe@ti.com]
> Sent: Friday, July 01, 2016 2:27 PM
> To: sdk-extended@list.ti.com - sdk team (contains XIDs & non-TI emails) (May contain non-TIers)
> Subject: Build failed in Jenkins: GLSDK_Nightly_Build_Krogoth #608
> 
> See <https://jenkins-swcoe.india.ti.com/job/GLSDK_Nightly_Build_Krogoth/608/>
> 
> ------------------------------------------
> [...truncated 80 lines...]
> 
> Fetching origin
> Already on 'krogoth'
> Your branch is up-to-date with 'origin/krogoth'.
> Already up-to-date.
> 
> 
> cloning repo meta-linaro
> 
> Fetching origin
> Already on 'krogoth'
> Your branch is up-to-date with 'origin/krogoth'.
> Already up-to-date.
> 
> 
> cloning repo oe-core
> 
> Fetching origin
> Already on 'krogoth'
> Your branch is up-to-date with 'origin/krogoth'.
> Already up-to-date.
> 
> 
> ################################################################################
> The bblayers.conf configuration file has been created for you with some default values.  Please verify the contents of your conf/bblayers.conf file for correctness.
> 
> NOTE: Any additional entries to this file will be lost if the ./oe-layertool-setup.sh
>       script is run again.  To add entries permanently to this file
>       please add them to the config file used and rerun the
>       ./oe-layertool-setup.sh script.
> 
> 
> 
> ################################################################################
> The local.conf configuration file has been created for you with some default values.  Please verify the contents of your conf/local.conf file for correctness.
> 
> By default the number of threads used by the build is set to the number of CPUs found on your system.
> 
> NOTE: You will probably want to change the default MACHINE setting in the
>       local.conf file to the machine you are trying to build.
> 
> WARNING: Found existing /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/conf/local.conf
> Saving a backup to /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/conf/local.conf.bak
> 
> 
> ################################################################################
> A setenv file has been created for you in the conf directory.  Please verify The contents of this file.  Once you have verified the contents please source this file to configure your environment for building:
> 
>     . conf/setenv
> 
> You can then start building using the bitbake command.  You will likely want to set the MACHINE option if you have not done so in your local.conf file.
> 
> For example:
>     MACHINE=xxxxx bitbake <target>
> 
> Common targets are:
>     core-image-minimal
>     core-image-sato
>     meta-toolchain
>     meta-toolchain-sdk
>     adt-installer
>     meta-ide-support
> NOTE: Started PRServer with DBfile: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46361, PID: 32074
> NOTE: Your conf/bblayers.conf has been automatically updated.
> Loading cache...done.
> Loaded 2821 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 2230 .bb files complete (2228 cached, 2 parsed). 2822 targets, 447 skipped, 0 masked, 0 errors.
> WARNING: No recipes available for:
>   /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "dra7xx-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2016.06"
> TUNE_FEATURES     = "arm armv7ve vfp thumb neon       callconvention-hard       cortexa15"
> TARGET_FPU        = "hard"
> meta-glsdk        = "master:c73bb46e708b074b73776fb25decda23a25049fc"
> meta-arago-distro
> meta-arago-extras = "krogoth:ce87398bcf24fbdd07eb89936745e11ebba004bf"
> meta-qt5          = "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
> meta-networking   
> meta-ruby         
> meta-python       
> meta-oe           = "krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a"
> meta-ti           = "krogoth:540818aaffea2ee8db79644c04f7d17037e27aac"
> meta-linaro-toolchain = "krogoth:642142732447482e66daf85cd8af83fc7ac95f23"
> meta              = "krogoth:1d0ea655e266e7c5acc9c282fa91406fbe9bfb85"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 1 of 3 (ID: 0, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_clean)
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_clean: Started
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_clean: Succeeded
> NOTE: Running task 2 of 3 (ID: 1, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_cleansstate)
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_cleansstate: Started
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_cleansstate: Succeeded
> NOTE: Running task 3 of 3 (ID: 2, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_cleanall)
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_cleanall: Started
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_cleanall: Succeeded
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> 
> Summary: There was 1 WARNING message shown.
> -------------------------------------------------
> Proceeding to launch bitbake
> -------------------------------------------------
> NOTE: Started PRServer with DBfile: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46060, PID: 32256 Loading cache...done.
> Loaded 2821 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 2230 .bb files complete (2228 cached, 2 parsed). 2822 targets, 447 skipped, 0 masked, 0 errors.
> WARNING: No recipes available for:
>   /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "dra7xx-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2016.06"
> TUNE_FEATURES     = "arm armv7ve vfp thumb neon       callconvention-hard       cortexa15"
> TARGET_FPU        = "hard"
> meta-glsdk        = "master:c73bb46e708b074b73776fb25decda23a25049fc"
> meta-arago-distro
> meta-arago-extras = "krogoth:ce87398bcf24fbdd07eb89936745e11ebba004bf"
> meta-qt5          = "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
> meta-networking   
> meta-ruby         
> meta-python       
> meta-oe           = "krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a"
> meta-ti           = "krogoth:540818aaffea2ee8db79644c04f7d17037e27aac"
> meta-linaro-toolchain = "krogoth:642142732447482e66daf85cd8af83fc7ac95f23"
> meta              = "krogoth:1d0ea655e266e7c5acc9c282fa91406fbe9bfb85"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running noexec task 3624 of 6908 (ID: 4, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_fetch)
> NOTE: Running noexec task 3625 of 6908 (ID: 0, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_unpack)
> NOTE: Running noexec task 3626 of 6908 (ID: 1, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_patch)
> NOTE: Running task 4467 of 6908 (ID: 2393, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb, do_install)
> NOTE: Running task 5418 of 6908 (ID: 11, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb, do_populate_lic)
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_populate_lic: Started
> NOTE: recipe uio-module-drv-test-2.1.0.0+gitAUTOINC+1976149588-r1: task do_install: Started
> ERROR: uio-module-drv-test-2.1.0.0+gitAUTOINC+1976149588-r1 do_install: Function failed: do_install (log file is located at /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/log.do_install.32339)
> ERROR: Logfile of failure stored in: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/log.do_install.32339
> Log data follows:
> | DEBUG: Executing shell function do_install
> | install: cannot stat
> | '/sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/ara
> | go-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-mod
> | ule-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/git/test/uio_mem_test': 
> | No such file or directory
> | WARNING: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/run.do_install.32339:1 exit 1 from 'install -c -m 755 /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/git/test/uio_mem_test /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/image/usr/bin/.'
> | ERROR: Function failed: do_install (log file is located at 
> | /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arag
> | o-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-modu
> | le-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/log.do_install.32339
> | )
> NOTE: recipe uio-module-drv-test-2.1.0.0+gitAUTOINC+1976149588-r1: task do_install: Failed
> ERROR: Task 2393 (/sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb, do_install) failed with exit code '1'
> NOTE: recipe tisdk-rootfs-image-1.0-r0: task do_populate_lic: Succeeded
> NOTE: Tasks Summary: Attempted 6699 tasks of which 6694 didn't need to be rerun and 1 failed.
> NOTE: Writing buildhistory
> 
> Summary: 1 task failed:
>   /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb, do_install
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> -------------------------------------------------
> Proceeding to copy the CCS from local storage
> -------------------------------------------------
> -------------------------------------------------
> Proceeding to launch bitbake -k
> -------------------------------------------------
> NOTE: Started PRServer with DBfile: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 34709, PID: 32442 Loading cache...done.
> Loaded 2821 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 2230 .bb files complete (2228 cached, 2 parsed). 2822 targets, 447 skipped, 0 masked, 0 errors.
> WARNING: No recipes available for:
>   /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-arago/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "dra7xx-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2016.06"
> TUNE_FEATURES     = "arm armv7ve vfp thumb neon       callconvention-hard       cortexa15"
> TARGET_FPU        = "hard"
> meta-glsdk        = "master:c73bb46e708b074b73776fb25decda23a25049fc"
> meta-arago-distro
> meta-arago-extras = "krogoth:ce87398bcf24fbdd07eb89936745e11ebba004bf"
> meta-qt5          = "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
> meta-networking   
> meta-ruby         
> meta-python       
> meta-oe           = "krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a"
> meta-ti           = "krogoth:540818aaffea2ee8db79644c04f7d17037e27aac"
> meta-linaro-toolchain = "krogoth:642142732447482e66daf85cd8af83fc7ac95f23"
> meta              = "krogoth:1d0ea655e266e7c5acc9c282fa91406fbe9bfb85"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 4467 of 6908 (ID: 2393, /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb, do_install)
> NOTE: recipe uio-module-drv-test-2.1.0.0+gitAUTOINC+1976149588-r1: task do_install: Started
> ERROR: uio-module-drv-test-2.1.0.0+gitAUTOINC+1976149588-r1 do_install: Function failed: do_install (log file is located at /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/log.do_install.32501)
> ERROR: Logfile of failure stored in: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/log.do_install.32501
> Log data follows:
> | DEBUG: Executing shell function do_install
> | install: cannot stat
> | '/sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/ara
> | go-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-mod
> | ule-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/git/test/uio_mem_test': 
> | No such file or directory
> | WARNING: /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/run.do_install.32501:1 exit 1 from 'install -c -m 755 /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/git/test/uio_mem_test /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-module-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/image/usr/bin/.'
> | ERROR: Function failed: do_install (log file is located at 
> | /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arag
> | o-tmp-external-linaro-toolchain/work/dra7xx_evm-linux-gnueabi/uio-modu
> | le-drv-test/2.1.0.0+gitAUTOINC+1976149588-r1/temp/log.do_install.32501
> | )
> NOTE: recipe uio-module-drv-test-2.1.0.0+gitAUTOINC+1976149588-r1: task do_install: Failed
> ERROR: Task 2393 (/sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb, do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 6892 tasks of which 6891 didn't need to be rerun and 1 failed.
> NOTE: Writing buildhistory
> 
> Summary: 1 task failed:
>   /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/sources/meta-ti/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb, do_install
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> -rw-r--r-- 1 services services 654593939 Jun 30 04:55 arago-tmp-external-linaro-toolchain/deploy/images/dra7xx-evm/tisdk-rootfs-image-dra7xx-evm-20160629185728.rootfs.tar.gz
> lrwxrwxrwx 1 services services        58 Jun 30 04:57 arago-tmp-external-linaro-toolchain/deploy/images/dra7xx-evm/tisdk-rootfs-image-dra7xx-evm.tar.gz -> tisdk-rootfs-image-dra7xx-evm-20160629185728.rootfs.tar.gz
> 
> real	1m9.678s
> user	0m42.536s
> sys	0m13.640s
> + df -h .
> Filesystem                                              Size  Used Avail Use% Mounted on
> /dev/disk/by-uuid/093623b5-7a9b-45e2-945f-362b716f28cb  443G  306G  115G  73% /
> + cd
> + /sdk/glsdk/workdir/glsdk-nightly/nightly/dra7xx/yocto/tisdk/build/arag
> + o-tmp-external-linaro-toolchain/deploy/images/dra7xx-evm
> + ls -alh '*-20*.ubifs'
> ls: cannot access *-20*.ubifs: No such file or directory Build step 'Conditional step (single)' marked build as failure

