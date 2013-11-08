Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6C2D552A3E
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2013 02:02:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA822OZw020113
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:02:24 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA822OIt026349
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:02:24 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Nov 2013 20:02:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA822NrQ014859;
	Thu, 7 Nov 2013 20:02:23 -0600
Date: Thu, 7 Nov 2013 21:02:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Tivy, Robert" <rtivy@ti.com>
Message-ID: <20131108020223.GW4510@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
	<13514BD7FAEBA745BBD7D8A672905C14573A6C00@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <13514BD7FAEBA745BBD7D8A672905C14573A6C00@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Fri, 08 Nov 2013 02:02:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 08, 2013 at 12:33:00AM +0000, Tivy, Robert wrote:
> Please see my comments inline below...

Thanks, Rob!
inline...

> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Thursday, November 07, 2013 3:50 AM
> > To: Maupin, Chase; meta-arago@arago-project.org
> > Cc: Ring, Chris; Tivy, Robert
> > Subject: RE: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > 
> 
> ...
> 
> > 
> > > >+
> > > >+S = "${WORKDIR}/git"
> > > >+
> > > >+inherit module
> > > >+
> > > >+do_compile () {
> > > >+    cd ${S}
> > > >+    make -f lu.mak module_clean
> > > >+    make -f lu.mak module
> > > >KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}
> > > >TOOLCHAIN_PREFIX=${CROSS_COMPILE}
> > >
> > > You should use the default do_compile in the module.bbclass I think.
> > You
> > > should be able to pass this with MAKE_TARGETS variable.
> > [Sam] Probably Chris and Rob on the CC list can comment on this. This
> > will need change of the module.
> 
> Can you please explain the change needed? I'm not familiar with do_compile().

Please see my other reply in this thread - I have both do_compile() and 
do_install() shown there. But the change would be more than just the make 
targets - there are slightly different variables used by default...

Anyway, I won't be insisting on this change, unless it is trivial for you to 
change.


> > > >+}
> > > >+
> > > >+do_install () {
> > > >+    cd ${S}
> > > >+    make -f lu.mak module_install
> > > >KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}"
> > > >EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"
> > > >INSTALL_MOD_PATH="${D}"
> > >
> > > Hmmm.  The default do_install for the module.bbclass uses
> > > "modules_install" instead of "module_install".  If you can get the
> > lu.mak file
> > > updated that would be ideal.  If not then you should at least copy
> > the base
> > > function which unsets some variables.
> > >
> > [Sam] Probably Chris and Rob on the CC list can comment on this. This
> > will need change of the module.
> 
> This should be fine, I will make a change to lu.mak and commit to ludev.git.
> 
> How about module_clean?  Should that be changed to modules_clean?

Well, modules_install comes from the kernel, as one of the standard make 
targets. There is no module(s)_clean there though, so it's up to you:

$ make help
Cleaning targets:
  clean           - Remove most generated files but keep the config and
                    enough build support to build external modules
  mrproper        - Remove all generated files + config + various backup files
  distclean       - mrproper + remove editor backup and patch files

Configuration targets:
  config          - Update current config utilising a line-oriented program
  nconfig         - Update current config utilising a ncurses menu based program
  menuconfig      - Update current config utilising a menu based program
  xconfig         - Update current config utilising a QT based front-end
  gconfig         - Update current config utilising a GTK based front-end
  oldconfig       - Update current config utilising a provided .config as base
  localmodconfig  - Update current config disabling modules not loaded
  localyesconfig  - Update current config converting local mods to core
  silentoldconfig - Same as oldconfig, but quietly, additionally update deps
  defconfig       - New config with default from ARCH supplied defconfig
  savedefconfig   - Save current config as ./defconfig (minimal config)
  allnoconfig     - New config where all options are answered with no
  allyesconfig    - New config where all options are accepted with yes
  allmodconfig    - New config selecting modules when possible
  alldefconfig    - New config with all symbols set to default
  randconfig      - New config with random answer to all options
  listnewconfig   - List new options
  olddefconfig    - Same as silentoldconfig but sets new symbols to their default value

Other generic targets:
  all             - Build all targets marked with [*]
* vmlinux         - Build the bare kernel
* modules         - Build all modules
  modules_install - Install all modules to INSTALL_MOD_PATH (default: /)
  firmware_install- Install all firmware to INSTALL_FW_PATH
                    (default: $(INSTALL_MOD_PATH)/lib/firmware)
  dir/            - Build all files in dir and below
  dir/file.[oisS] - Build specified target only
  dir/file.lst    - Build specified mixed source/assembly target only
                    (requires a recent binutils and recent build (System.map))
  dir/file.ko     - Build module including final link
  modules_prepare - Set up for building external modules
  tags/TAGS       - Generate tags file for editors
  cscope          - Generate cscope index
  gtags           - Generate GNU GLOBAL index
  kernelrelease   - Output the release version string
  kernelversion   - Output the version stored in Makefile
  image_name      - Output the image name
  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH
                    (default: /usr/src/linux-3.11.4/usr)

Static analysers
  checkstack      - Generate a list of stack hogs
  namespacecheck  - Name space analysis on compiled kernel
  versioncheck    - Sanity check on version.h usage
  includecheck    - Check for duplicate included header files
  export_report   - List the usages of all exported symbols
  headers_check   - Sanity check on exported headers
  headerdep       - Detect inclusion cycles in headers
  coccicheck      - Check with Coccinelle.

Kernel packaging:
  rpm-pkg             - Build both source and binary RPM kernel packages
  binrpm-pkg          - Build only the binary kernel package
  deb-pkg             - Build the kernel as a deb package
  tar-pkg             - Build the kernel as an uncompressed tarball
  targz-pkg           - Build the kernel as a gzip compressed tarball
  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball
  tarxz-pkg           - Build the kernel as a xz compressed tarball
  perf-tar-src-pkg    - Build perf-3.11.4.tar source tarball
  perf-targz-src-pkg  - Build perf-3.11.4.tar.gz source tarball
  perf-tarbz2-src-pkg - Build perf-3.11.4.tar.bz2 source tarball
  perf-tarxz-src-pkg  - Build perf-3.11.4.tar.xz source tarball

Documentation targets:
 Linux kernel internal documentation in different formats:
  htmldocs        - HTML
  pdfdocs         - PDF
  psdocs          - Postscript
  xmldocs         - XML DocBook
  mandocs         - man pages
  installmandocs  - install man pages generated by mandocs
  cleandocs       - clean all generated DocBook files

Architecture specific targets (x86):
* bzImage      - Compressed kernel image (arch/x86/boot/bzImage)
  install      - Install kernel using
                  (your) ~/bin/installkernel or
                  (distribution) /sbin/installkernel or
                  install to $(INSTALL_PATH) and run lilo
  fdimage      - Create 1.4MB boot floppy image (arch/x86/boot/fdimage)
  fdimage144   - Create 1.4MB boot floppy image (arch/x86/boot/fdimage)
  fdimage288   - Create 2.8MB boot floppy image (arch/x86/boot/fdimage)
  isoimage     - Create a boot CD-ROM image (arch/x86/boot/image.iso)
                  bzdisk/fdimage*/isoimage also accept:
                  FDARGS="..."  arguments for the booted kernel
                  FDINITRD=file initrd for the booted kernel
  kvmconfig     - Enable additional options for guest kernel support

  x86_64_defconfig         - Build for x86_64
  i386_defconfig           - Build for i386

  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build
  make V=2   [targets] 2 => give reason for rebuild of target
  make O=dir [targets] Locate all output files in "dir", including .config
  make C=1   [targets] Check all c source with $CHECK (sparse by default)
  make C=2   [targets] Force check of all c source with $CHECK
  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections
  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where
                1: warnings which may be relevant and do not occur too often
                2: warnings which occur quite often but may still be relevant
                3: more obscure warnings, can most likely be ignored
                Multiple levels can be combined with W=12 or W=123

Execute "make" or "make all" to build all targets marked with [*] 
For further info see the ./README file


> > > Is there perhaps a value to having the version in the package name
> > instead of
> > > using _git versions?  Will all SDKs be in step with using the same
> > version?
> > >
> > [Sam] Chris or Rob, can you comment on this.  I am not sure of when the
> > other verticals pick up CMEM.
> 
> I need to let Chris comment on this.
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

