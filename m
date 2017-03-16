Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0DC6E529A9
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 20:28:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GKS6Xx016026
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 15:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489696086;
	bh=IdzSZ+JmoNbf44//TyoaO8ivmPFpACIcqj6v/XtYF2U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QC/FQI2VjxXyaaMwnLdNJoKSbBtSXSAeX6jnvOQuViNaDF2bdU6CbPg78q37Mrh8r
	af47tWrRsQ9yBBriMWF4+9lUMjB6pUwW8aqzl8iaIZGSgJCxWFDugs2FodvM2f9YMs
	irmoOUvK/owcfpkVGIZd/yTbss3tH3QQXiIiTte8=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GKS6RN023541
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 15:28:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 15:28:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GKS5pT025552;
	Thu, 16 Mar 2017 15:28:05 -0500
Date: Thu, 16 Mar 2017 16:28:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20170316202805.GT14484@edge>
References: <1489600884-27644-1-git-send-email-j-stiffler@ti.com>
	<20170316192033.GP14484@edge> <20170316192359.GQ14484@edge>
MIME-Version: 1.0
In-Reply-To: <20170316192359.GQ14484@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 1/2] ocl: update to version 1.1.12.0
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
X-List-Received-Date: Thu, 16 Mar 2017 20:28:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 16, 2017 at 03:23:59PM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 16, 2017 at 03:20:33PM -0400, Denys Dmytriyenko wrote:
> > Jake,
> > 
> > It appears the new version no longer provides libOpenCL.so - is it expected?
> 
> Actually, it does provide it, just messing up the debian package renaming due 
> to all the new stuff... I'll see if I can correct it.

It's not just few packagegroups, it's everything that depends on opencl 
(opencv, openmp, examples, etc.) is affected. If you build from scratch every 
time, you won't see it.

I've submitted a patch to hopefully resolve it:
http://arago-project.org/pipermail/meta-arago/2017-March/008854.html

This doesn't only affect incremental builds, but also package feeds and would 
break package/distro upgrades in the field. Unfortunately, we haven't been 
paying much attention to this problem in the past, but as we've already 
discussed, we should keep an eye on it...

-- 
Denys


> > It is currently breaking incremental builds due to package naming change... 
> > The workaround is to either make a clean build or bump PR in affected 
> > packagegroups. Before doing that, I'm trying to see if there was an issue 
> > with the new version. Please let me know.
> > 
> > -- 
> > Denys
> > 
> > 
> > On Wed, Mar 15, 2017 at 02:01:23PM -0400, Jacob Stiffler wrote:
> > > * opencl : add systemd service for MCT daemon
> > > * monitor : sources unified between platforms
> > > * examples : add new examples
> > > 
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  meta-arago-extras/recipes-ti/ocl/ocl.inc                |  4 ++--
> > >  meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb |  2 ++
> > >  meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb  |  2 --
> > >  meta-arago-extras/recipes-ti/ocl/opencl_git.bb          | 12 +++++++++++-
> > >  4 files changed, 15 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> > > index 38f08b9..94e3dd8 100644
> > > --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> > > +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> > > @@ -1,4 +1,4 @@
> > > -PV = "1.1.11.2"
> > > +PV = "1.1.12.0"
> > >  INC_PR = "r0"
> > >  
> > >  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> > > @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
> > >  OCL_GIT_PROTOCOL = "git"
> > >  OCL_GIT_BRANCH = "master"
> > >  
> > > -OCL_SRCREV = "5a8f16bb1809a410b961292ae070d079b89e749a"
> > > +OCL_SRCREV = "8c0ec9c270cafaef0a56c376fc28c1b7714cb09c"
> > >  
> > >  BRANCH = "${OCL_GIT_BRANCH}"
> > >  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> > > diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> > > index c69b7e2..cc1db80 100644
> > > --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> > > +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> > > @@ -35,6 +35,8 @@ OCL_EXAMPLE_LIST = " buffer \
> > >                       vecadd_openmp \
> > >                       vecadd_openmp_t \
> > >                       dgemm \
> > > +                     abort_exit \
> > > +                     timeout \
> > >  "
> > >  
> > >  python do_unpack_append() {
> > > diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> > > index 8fc1e81..c0a8a6c 100644
> > > --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> > > +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> > > @@ -45,8 +45,6 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  
> > >  S = "${WORKDIR}/git/monitor"
> > > -S_dra7xx = "${WORKDIR}/git/monitor_vayu"
> > > -S_k2g = "${WORKDIR}/git/monitor_vayu"
> > >  
> > >  BUILD_TARGET_k2hk-evm = "ARM_K2H"
> > >  BUILD_TARGET_k2l-evm  = "ARM_K2L"
> > > diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > > index 9676687..1d39274 100644
> > > --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > > +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > > @@ -6,7 +6,7 @@ include ocl.inc
> > >  
> > >  PR = "${INC_PR}.0"
> > >  
> > > -inherit cmake
> > > +inherit cmake systemd
> > >  
> > >  COMPATIBLE_MACHINE = "dra7xx|keystone"
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > @@ -58,6 +58,16 @@ EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABL
> > >  EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
> > >  export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
> > >  
> > > +MCTD = "${S}/mct-daemon/ti-mct-daemon.service.k2x"
> > > +MCTD_dra7xx = "${S}/mct-daemon/ti-mct-daemon.service.am57x"
> > > +
> > > +do_install_append() {
> > > +    install -d ${D}${systemd_system_unitdir}
> > > +    install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.service
> > > +}
> > > +
> > > +SYSTEMD_SERVICE_${PN} = "ti-mct-daemon.service"
> > > +
> > >  FILES_${PN} += " \
> > >      ${datadir}/ti/opencl/* \
> > >  "
> > > -- 
> > > 2.7.4
> > > 
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

