Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7C855529E4
	for <meta-arago@arago-project.org>;
	Mon,  7 Dec 2015 15:15:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB7FFcFj014542
	for <meta-arago@arago-project.org>; Mon, 7 Dec 2015 09:15:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB7FFcCG027735
	for <meta-arago@arago-project.org>; Mon, 7 Dec 2015 09:15:38 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Dec 2015 09:15:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB7FFb74006567;
	Mon, 7 Dec 2015 09:15:37 -0600
Date: Mon, 7 Dec 2015 10:15:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151207151521.GG6264@edge>
References: <1449282304-13964-1-git-send-email-denis@denix.org>
	<1449282304-13964-2-git-send-email-denis@denix.org>
	<566577B6.20606@ti.com> <20151207145857.GF6264@edge>
MIME-Version: 1.0
In-Reply-To: <20151207145857.GF6264@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] opencl-monitor: fix alternatives handling
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
X-List-Received-Date: Mon, 07 Dec 2015 15:15:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

And BTW, building opencl-monitor for keystone is not in upstream, hence no 
issues in nightlies... Hint - please submit the necessary changes for opencl 
on keystone.


On Mon, Dec 07, 2015 at 09:58:57AM -0500, Denys Dmytriyenko wrote:
> Looks like when you build just opencl-monitor directly, the renaming doesn't 
> happen in the sysroots, but only for the packaging. So, even though the IPK 
> gets files renamed with ${BPN} suffix, the same files in sysroots are 
> installed w/o such suffix, leading to conflicts with dspdce-fw and also 
> ipc-test-fw after it got update-alternatives added.
> 
> BTW, do_install_append can be machine-speicfic to dra7xx...
> 
> 
> $ MACHINE=am57xx-evm bitbake opencl-monitor -c cleansstate
> $ MACHINE=am57xx-evm bitbake opencl-monitor
> $ ls ${TMPDIR}/sysroots/am57xx-evm/lib/firmware/dra7-dsp*
> ./sysroots/am57xx-evm/lib/firmware/dra7-dsp2-fw.xe66
> ./sysroots/am57xx-evm/lib/firmware/dra7-dsp1-fw.xe66
> 
> Also, the error message looks like this:
> 
> ERROR: The recipe dspdce-fw is trying to install files into a shared area when 
> those files already exist. Those files and their manifest location are:
>   .../sysroots/am57xx-evm/lib/firmware/dra7-dsp1-fw.xe66
>  Matched in manifest-am57xx-evm-opencl-monitor.populate_sysroot
> Please verify which recipe should provide the above files.
> The build has stopped as continuing in this scenario WILL break things, if not 
> now, possibly in the future (we've seen builds fail several months later). If 
> the system knew how to recover from this automatically it would however there 
> are several different scenarios which can result in this and we don't know 
> which one this is. It may be you have switched providers of something like 
> virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in that case you 
> need to execute the clean task for both recipes and it will resolve this 
> error. It may be you changed DISTRO_FEATURES from systemd to udev or vice 
> versa. Cleaning those recipes should again resolve this error however 
> switching DISTRO_FEATURES on an existing build directory is not supported, you 
> should really clean out tmp and rebuild (reusing sstate should be safe). It 
> could be the overlapping files detected are harmless in which case adding them 
> to SSTATE_DUPWHITELIST may be the correct solution. It could also be your 
> build is including two different conflicting versions of things (e.g. bluez 4 
> and bluez 5 and the correct solution for that would be to resolve the 
> conflict. If in doubt, please ask on the mailing list, sharing the error and 
> filelist above.
> ERROR: If the above message is too much, the simpler version is you're advised 
> to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix 
> things in most (but not all) cases.
> ERROR: Function failed: sstate_task_postfunc
> ERROR: Logfile of failure stored in: .../work/cortexa15hf-vfp-neon-linux-gnueabi/dspdce-fw/1.00.00.06-r1/temp/log.do_populate_sysroot.20654
> ERROR: Task 3 (.../sources/meta-ti/recipes-bsp/dspdce-fw/dspdce-fw_git.bb, do_populate_sysroot) failed with exit code '1'
> 
> 
> On Mon, Dec 07, 2015 at 07:12:38AM -0500, Jacob Stiffler wrote:
> > NAK
> > 
> > 
> > This breaks opencl-monitor for keystone as there is no dra7-dsp$i-fw.xe66.
> > 
> > Why was this change necessary? According to the documentation,
> > update-alternatives will automatically do this renaming.
> > 
> > Frm openembedded-core/meta/classes/update-alternative.bbclass:
> > >>>
> > # NOTE: If the ALTERNATIVE_LINK_NAME and ALTERNATIVE_TARGET are the same,
> > # ALTERNATIVE_TARGET will have '.{BPN}' appended to it.  If the file
> > # referenced has not been renamed, it will also be renamed.  (This avoids
> > # the need to rename alternative files in the do_install step, but still
> > # supports it if necessary for some reason.)
> > <<<
> > 
> > - Jake
> > 
> > 
> > On 12/4/2015 9:25 PM, Denys Dmytriyenko wrote:
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > >  meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> > >index fbc4949..6657ba8 100644
> > >--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> > >+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> > >@@ -47,9 +47,15 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
> > >  export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
> > >  export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
> > >+do_install_append() {
> > >+	for i in 1 2; do mv ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66 ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66.${BPN}; done
> > >+}
> > >+
> > >  ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
> > >-ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "/lib/firmware/dra7-dsp1-fw.xe66"
> > >-ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "/lib/firmware/dra7-dsp2-fw.xe66"
> > >+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
> > >+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}"
> > >+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
> > >+ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}"
> > >  ALTERNATIVE_PRIORITY = "100"
> > >  MONITOR_FIRMWARE = ""
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

