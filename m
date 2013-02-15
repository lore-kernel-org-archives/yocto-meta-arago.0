Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EFB5752A79
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 01:36:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1F1aSgk020025
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 19:36:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1F1aSZj016613
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 19:36:28 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 14 Feb 2013 19:36:27 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1F1aRas019569;
	Thu, 14 Feb 2013 19:36:27 -0600
Date: Thu, 14 Feb 2013 20:36:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>
Message-ID: <20130215013627.GM2539@edge>
References: <1360880920-24652-1-git-send-email-sajesh@ti.com>
	<20130215012046.GC9154@denix.org>
	<8EAE6244CE843044A42356038645C8551564C358@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8EAE6244CE843044A42356038645C8551564C358@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Added ti-multiproc manager recipe for KeyStone2 devices
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
X-List-Received-Date: Fri, 15 Feb 2013 01:36:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 14, 2013 at 08:34:15PM -0500, Saran, Sajesh Kumar wrote:
> The internal git repo is temporary. It will be moved to external soon.

Yes, I know, as I was part of the discussion deciding where to host it - 
git.ti.com or arago-project.org...

> What do you want me to put in instead of AUTOREV?

Latest commit for now would be fine. Once your code matures, you can point it 
to the latest stable release.

-- 
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, February 14, 2013 8:21 PM
> To: Saran, Sajesh Kumar
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] Added ti-multiproc manager recipe for KeyStone2 devices
> 
> Sajesh,
> 
> Thanks for submitting your patch to the list. It mostly looks good, but here are few comments:
> 
> [PATCH] Added ti-multiproc manager recipe for KeyStone2 devices
> 
> Please follow the OpenEmbedded Patch Message Guidelines:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> 
> Basically, it means the commit/patch subject should look like this:
> 
> [PATCH] multiprocmgr: add initial version
> 
> 
> On Thu, Feb 14, 2013 at 05:28:40PM -0500, Sajesh Kumar Saran wrote:
> > 
> > Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
> > ---
> >  .../multiprocmgr/ti-multiprocmgr_git.bb            |   19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 
> > meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb
> > 
> > diff --git 
> > a/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.
> > bb 
> > b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.
> > bb
> > new file mode 100644
> > index 0000000..c72bc7d
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_
> > +++ git.bb
> 
> I don't mind it too much, but do we still need to abuse ti-* prefix for our own software? Can it be simply multiprocmgr?
> 
> 
> > @@ -0,0 +1,19 @@
> > +DESCRIPTION = "TI Multiproc Manager for KeyStone II"
> > +HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
> > +LICENSE = "BSD & MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
> > +SECTION = "console"
> 
> If you really want this to be available to Keystone machines, you'd want:
> 
> COMPATIBLE_MACHINE = "keystone"
> 
> 
> > +PR = "r2"
> 
> I don't usually complain about PR being out of sequence, or starting with 1 
> vs. 0, but other people may find this a problem. Just FYI...
> 
> 
> > +BRANCH ?= "master"
> 
> > +SRCREV = "${AUTOREV}"
> > +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
> 
> The use of AUTOREV and non-public internal git repository would break parsing 
> for anyone doing builds outside of TI network.
> 
> Using non-public internal git repository temporarily until you get your 
> project published externally is somewhat acceptable. And AUTOREV in rare cases 
> is also acceptable, although it's quite unstable. But definitely don't use 
> them both.
> 
> 
> > +S = "${WORKDIR}/git"
> > +
> > +do_install() {
> > +	install -d ${D}${bindir}/
> > +	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
> > +}
> > -- 
> > 1.7.9.5

