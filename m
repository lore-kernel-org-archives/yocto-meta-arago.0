Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3E5EC52A7A
	for <meta-arago@arago-project.org>;
	Tue, 30 Sep 2014 21:06:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8UL6ihh011001;
	Tue, 30 Sep 2014 16:06:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8UL6i8s017528;
	Tue, 30 Sep 2014 16:06:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Sep 2014 16:06:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8UL6iEo018651;
	Tue, 30 Sep 2014 16:06:44 -0500
Date: Tue, 30 Sep 2014 17:06:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140930210643.GP6303@edge>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C73EA99@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C73EA99@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/7] libinput: update to 0.6.0
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
X-List-Received-Date: Tue, 30 Sep 2014 21:06:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 26, 2014 at 05:50:03PM +0000, Cooper Jr., Franklin wrote:
> Any reason to update all these library versions? Or is it just to remove the 
> patches I've added since its upstream?

Hmm, I seem to have missed this question.

The reason is simple - this is the latest release, which contains the 
necessary patches that we had to pick up through a snapshot and local 
patching.

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, September 26, 2014 10:41 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 1/7] libinput: update to 0.6.0
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../wayland/{libinput_git.bb => libinput_0.6.0.bb}     | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)  rename meta-arago-
> > extras/recipes-graphics/wayland/{libinput_git.bb => libinput_0.6.0.bb} (42%)
> > 
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> > b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
> > similarity index 42%
> > rename from meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> > rename to meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
> > index 6635e7d..c3bbb7b 100644
> > --- a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
> > +++ b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
> > @@ -1,20 +1,14 @@
> > -DESCRIPTION = "libinput is a library to handle input devices in Wayland
> > compositors"
> > +SUMMARY = "Library to handle input devices in Wayland compositors"
> >  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
> > +SECTION = "libs"
> > 
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
> > 
> > -inherit autotools pkgconfig
> > -
> >  DEPENDS = "libevdev udev mtdev"
> > 
> > -PR = "r2"
> > -
> > -BRANCH = "master"
> > -SRCREV = "0647574c46e5e930063ace7b35385213dca33dc1"
> > +SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> > +SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
> > +SRC_URI[sha256sum] =
> > "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bf
> > bc"
> > 
> > -PV = "0.5.0"
> > -
> > -SRC_URI =
> > "git://anongit.freedesktop.org/wayland/libinput;protocol=git;branch=${BRA
> > NCH}"
> > -
> > -S = "${WORKDIR}/git"
> > +inherit autotools pkgconfig
> > --
> > 2.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

