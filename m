Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 507DF52A0A
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:43:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAFNhO3t022397;
	Thu, 15 Nov 2012 17:43:24 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFNhO1K026922;
	Thu, 15 Nov 2012 17:43:24 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 15 Nov 2012 17:43:24 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAFNhOPn026586;
	Thu, 15 Nov 2012 17:43:24 -0600
Date: Thu, 15 Nov 2012 18:43:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121115234322.GM10887@edge>
References: <1353021956-18687-1-git-send-email-fcooper@ti.com>
	<1353021956-18687-3-git-send-email-fcooper@ti.com>
	<20121115233049.GK10887@edge>
	<8F29D6B095ED194EA1980491A5E029710C321AE8@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C321AE8@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] task-arago-qte-toolchain-target: Add additional packages
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
X-List-Received-Date: Thu, 15 Nov 2012 23:43:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 15, 2012 at 06:39:43PM -0500, Cooper Jr., Franklin wrote:
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, November 15, 2012 5:31 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-target: Add additional packages
> 
> On Thu, Nov 15, 2012 at 05:25:56PM -0600, Franklin S. Cooper Jr wrote:
> > * Adding additional packages that were automatically installed with Qt in
> >   classic Arago but not being done now.
> > * This insures the packages installed in the old SDK matches the new one.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../tasks/task-arago-qte-toolchain-target.bb       |   16 ++++++++++++++--
> >  1 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git 
> > a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target
> > .bb 
> > b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target
> > .bb
> > index d919af2..2635c63 100644
> > --- 
> > a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-target
> > .bb
> > +++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-ta
> > +++ rget.bb
> > @@ -2,12 +2,20 @@ DESCRIPTION = "Target packages for Qt Embedded SDK"
> >  LICENSE = "MIT"
> >  ALLOW_EMPTY = "1"
> >  
> > -PR = "r2"
> > +PR = "r3"
> >  
> >  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> >                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> >  
> > +
> > +QT_SGX_SUPPORT = "\
> > +    qt4-embedded-gles-dev \
> 
> ^^^
> 
> > +    libqt-embeddedopengl4-dev \
> > +    libqt-embeddedpvrqwswsegl4-dev \
> > +"
> > +
> >  RDEPENDS_${PN} += " \
> > +        qt4-embedded-dev \
> 
> ^^^
> I still don't think we need this...
> 
> Also, you have qt4-embedded-gles-dev conditionally, but qt4-embedded-dev unconditionally - is that right?
> 
> Franklin:
> No. It should have been:
> ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',' qt4-embedded-gles-dev', ' qt4-embedded-dev ', d)} \

Ok, I thought so.

> And the qt4-embedded package doesn't exist. Why it doesn't complaining I am not sure but the content of the qt4-embedded-dev package is not being included in linux-devkit

But then again, I don't think we need it:
http://arago-project.org/pipermail/meta-arago/2012-November/000487.html

> 
> >          task-core-standalone-sdk-target \
> >          qt4-embedded-mkspecs \
> >          libqt-embeddedmultimedia4-dev \
> > @@ -30,4 +38,8 @@ RDEPENDS_${PN} += " \
> >          libqt-embeddedwebkit4-dev \
> >          libqt-embeddedxml4-dev \
> >          libsqlite3-dev \
> > -        "
> > +        libqt-embeddedxmlpatterns4-dev \
> > +        libqt-embeddedmultimedia4-dev \
> > +        libqt-embeddeddeclarative4-dev \
> > +        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT_SGX_SUPPORT}', '', d)} \
> > +"
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

