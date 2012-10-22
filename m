Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 93AE852AB1
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 18:07:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MI7UcY019169;
	Mon, 22 Oct 2012 13:07:30 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MI7UIq013260;
	Mon, 22 Oct 2012 13:07:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 22 Oct 2012 13:07:30 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9MI7U5s016878;
	Mon, 22 Oct 2012 13:07:30 -0500
Date: Mon, 22 Oct 2012 14:07:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121022180729.GP30921@edge>
References: <1350021454-12557-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C3D5@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C306CB0@DFLE09.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015926D377@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C3093DF@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C3093DF@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] task-arago-tisdk-graphics: Create graphics task
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
X-List-Received-Date: Mon, 22 Oct 2012 18:07:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 22, 2012 at 06:05:37PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> -----Original Message-----
> From: Maupin, Chase 
> Sent: Thursday, October 18, 2012 8:32 AM
> To: Cooper Jr., Franklin; Franklin S. Cooper Jr; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create graphics task
> 
> 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Thursday, October 18, 2012 1:26 AM
> > To: Maupin, Chase; Franklin S. Cooper Jr; meta-arago@arago- 
> > project.org
> > Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics:
> > Create graphics task
> > 
> > 
> > 
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Friday, October 12, 2012 9:52 PM
> > To: Franklin S. Cooper Jr; meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics:
> > Create graphics task
> > 
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago- 
> > > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > > Sent: Friday, October 12, 2012 12:58 AM
> > > To: meta-arago@arago-project.org
> > > Cc: Cooper Jr., Franklin
> > > Subject: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create 
> > > graphics task
> > >
> > > * Create graphics task that groups the various packages from
> > the
> > > Graphics SDK
> > >   recipe.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../tasks/task-arago-tisdk-graphics-sdk-target.bb  |   11
> > > +++++++++++
> > >  .../tasks/task-arago-tisdk-graphics.bb             |   17
> > > +++++++++++++++++
> > >  2 files changed, 28 insertions(+), 0 deletions(-)  create mode
> > 100644
> > > meta-arago-distro/recipes-core/tasks/task-
> > > arago-tisdk-graphics-sdk-target.bb
> > >  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> > > arago-tisdk-graphics.bb
> > >
> > > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes- 
> > > core/tasks/task-arago-tisdk-graphics-sdk-target.bb
> > > new file mode 100644
> > > index 0000000..3de0809
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> > > graphics-sdk-target.bb
> > > @@ -0,0 +1,11 @@
> > > +DESCRIPTION = "Task to install graphics binaries on sdk
> > target"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> > >
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b
> > > 4de20420"
> > > +COMPATIBLE_MACHINE = "ti33x|omap3"
> > 
> > Same issue with COMPATIBLE_MACHINE as your other recipe.  This will 
> > break devices like am180x-evm
> > 
> > > +PR = "r0"
> > > +
> > > +inherit task
> > > +
> > > +RDEPENDS_${PN} = "\
> > > +    libgles-omap3-dev \
> > > +"
> > > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-graphics.bb b/meta-arago-distro/recipes-core/tasks/task-
> > > arago-tisdk-graphics.bb
> > > new file mode 100644
> > > index 0000000..2c0b3a6
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> > > graphics.bb
> > > @@ -0,0 +1,17 @@
> > > +DESCRIPTION = "Task to install graphics binaries"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> > >
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b
> > > 4de20420"
> > > +COMPATIBLE_MACHINE = "ti33x|omap3"
> > 
> > COMPATIBLE_MACHINE issue
> > 
> > > +PR = "r0"
> > > +
> > > +inherit task
> > > +
> > > +RDEPENDS_${PN} = "\
> > > +    libgles-omap3 \
> > > +    libgles-omap3-blitwsegl \
> > > +    libgles-omap3-flipwsegl \
> > > +    libgles-omap3-frontwsegl \
> > > +    libgles-omap3-linuxfbwsegl \
> > > +    libgles-omap3-rawdemos \
> > > +    omap3-sgx-modules \
> > > +"
> > 
> > Where are the Qt example applications like qt-tstat, qml- playground, 
> > etc?  Are you putting those into a different task?
> > 
> > Where is the sdk-host task to install the example application sources 
> > in the case of qt-tstat, etc being installed by this task?
> > 
> > Franklin:
> > Qt-tstat is being replaced with our new thermostat demo. I am going to 
> > work with Dave on that recipe when I get back.
> > Qml-playground is currently having build issues with the new version 
> > of qt so I have not created that recipe yet.
> > 
> > I am not placing the Qt demos inside of the graphics task. Qt- tstat 
> > doesn't require opengl and qml-playground looks like it can be used 
> > without opengl.
> > I will probably create a task-arago-tisdk-qte recipe that adds 
> > task-arago-qte and any extra qt demos we will likely have in the 
> > future. Also a corresponding  task-arago-qte-sdk-target/host recipe.
> > 
> > Also you said "etc" above. What other Qt demos am I missing?
> 
> I was thinking of the other Qt demos like deform.  Perhaps you have those in 
> your matrix task?
> 
> Franklin:
> Deform, animated tiles, calculator and browser are automatically built when 
> Qt is built. Matrix-gui-qt4-demos contains the Matrix related files and 
> scripts for those demos.

They may be built, but if you don't have them in any RDEPENDS, they won't be 
installed...

-- 
Denys

