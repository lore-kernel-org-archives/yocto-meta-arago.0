Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8DB755298C
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 14:14:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48EECOC026921
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 09:14:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48EECtF019620
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 09:14:12 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 09:14:12 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r48EECef019686;
	Wed, 8 May 2013 09:14:12 -0500
Date: Wed, 8 May 2013 10:14:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130508141411.GC13151@edge>
References: <1367875170-8518-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED10159546E35@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159546E35@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Zhou,
	Jingting" <zhoujt@ti.com>
Subject: Re: [PATCH 1/2] initscript-debugfs recipe: needed by ti-multiprocmgr, system printf messages coming from debugfs
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
X-List-Received-Date: Wed, 08 May 2013 14:14:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 08, 2013 at 01:04:09PM +0000, Maupin, Chase wrote:
> > Subject: [meta-arago] [PATCH 1/2] initscript-debugfs recipe:
> > needed by ti-multiprocmgr, system printf messages coming from
> > debugfs
> > 
> > From: Jingting Zhou <a0221004@ares-ubuntu>
> 
> So close you are almost there.  A couple of points.

Ah, words of encouragement - good idea :) Few more comments:


> 1. You need to fix your e-mail.  You should use your ti.com address.  This 
> is the e-mail setting in your u-boot config.

1. To quickly set your email in git configuration, use this line:

git config --global user.email zhoujt@ti.com

To check current config, git config -l
But getting more familiar with git in general is a good idea - use a 
presentation or training material.


> 2. The commit message should be something like:
> 
> Recipe: brief description of change
> 
> * Detail 1 about change and why
> * Detail 2 about change and why
> 
> Signed-off-by: your name <your email>

2. What Chase explained for the commit message is good and will start you up, 
but it's just a very brief version of the Commit Message Guidelines here:
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines


> If you have your e-mail configured then you can have your signed-off-by 
> automatically added to your commit message by using -s when commiting.  I'll 
> send you a git presentation that has some info on setting these.

-- 
Denys



> > ---
> >  .../initscript-debugfs/files/debugfs.sh            |   40
> > ++++++++++++++++++++
> >  .../initscript-debugfs/initscript-debugfs.bb       |   20
> > ++++++++++
> >  2 files changed, 60 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/debugfs.sh
> >  create mode 100755 meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > 
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/debugfs.sh b/meta-arago-extras/recipes-
> > bsp/initscript-debugfs/files/debugfs.sh
> > new file mode 100755
> > index 0000000..9b26279
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/files/debugfs.sh
> > @@ -0,0 +1,40 @@
> > +#!/bin/sh
> > +
> > +#   Copyright 2012, Texas Instruments, Inc.
> > +#
> > +#   Redistribution and use in source and binary forms, with or
> > without
> > +#   modification, are permitted provided that the following
> > conditions
> > +#   are met:
> > +#
> > +#     Redistributions of source code must retain the above
> > copyright
> > +#     notice, this list of conditions and the following
> > disclaimer.
> > +#
> > +#     Redistributions in binary form must reproduce the above
> > copyright
> > +#     notice, this list of conditions and the following
> > disclaimer in the
> > +#     documentation and/or other materials provided with the
> > +#     distribution.
> > +#
> > +#     Neither the name of Texas Instruments Incorporated nor the
> > names of
> > +#     its contributors may be used to endorse or promote
> > products derived
> > +#     from this software without specific prior written
> > permission.
> > +#
> > +#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> > CONTRIBUTORS
> > +#   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> > BUT NOT
> > +#   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> > FITNESS FOR
> > +#   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> > COPYRIGHT
> > +#   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> > INCIDENTAL,
> > +#   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> > NOT
> > +#   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> > LOSS OF USE,
> > +#   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> > AND ON ANY
> > +#   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> > OR TORT
> > +#   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> > OF THE USE
> > +#   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> > DAMAGE.
> > +#
> > +
> > +
> > +if ! [ -e /debug ] ; then
> > +  mkdir -p /debug
> > +fi
> > +mount -t debugfs debugfs /debug
> > +
> > +exit 0
> > diff --git a/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb b/meta-arago-extras/recipes-
> > bsp/initscript-debugfs/initscript-debugfs.bb
> > new file mode 100755
> > index 0000000..f8145ba
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/initscript-
> > debugfs/initscript-debugfs.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION = "Initscripts for debugfs"
> > +LICENSE = "BSD"
> > +
> > +LIC_FILES_CHKSUM =
> > "file://debugfs.sh;startline=3;endline=32;md5=4d96701a693bf321ad2
> > d15026a285446"
> > +
> > +PR ="r0"
> > +
> > +SRC_URI = "file://debugfs.sh"
> > +
> > +INITSCRIPT_NAME = "debugfs.sh"
> > +INITSCRIPT_PARAMS = "start 09 S ."
> > +
> > +inherit update-rc.d
> > +
> > +S = "${WORKDIR}"
> > +
> > +do_install () {
> > +	install -d ${D}${sysconfdir}/init.d/
> > +	install -c -m 755 ${WORKDIR}/debugfs.sh
> > ${D}${sysconfdir}/init.d/debugfs.sh
> > +}
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

