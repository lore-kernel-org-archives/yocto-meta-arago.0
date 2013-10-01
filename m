Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A6A9E529A7
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:28:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DSl64017955
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:28:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DSlWI011079
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:28:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 08:28:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DSlIM001539;
	Tue, 1 Oct 2013 08:28:47 -0500
Date: Tue, 1 Oct 2013 09:28:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131001132846.GE26572@edge>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-12-git-send-email-denis@denix.org>
	<4FEEA6A8-A5F9-41F2-A88D-731FC280F154@ti.com>
MIME-Version: 1.0
In-Reply-To: <4FEEA6A8-A5F9-41F2-A88D-731FC280F154@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 11/13] arago.conf: set QT_PROVIDER to Qt5, bump distro version
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
X-List-Received-Date: Tue, 01 Oct 2013 13:28:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 01, 2013 at 01:23:27PM +0000, Cooper Jr., Franklin wrote:
> As long as we put this on a separate branch based on my reasoning I 
> mentioned on this patch set cover sheet then I have no problem with this.

Yeah, this was rather meant for the demo of Qt5-based matrix-browser, not as a 
default value right away. I'd rather drop this and stick with Qt4 for a while, 
if we can get everything else in to the master.


> > On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > meta-arago-distro/conf/distro/arago.conf | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > index 18299bd..7ecd2b4 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -1,6 +1,8 @@
> > # Name and version of the distribution
> > DISTRO_NAME = "Arago"
> > -DISTRO_VERSION = "2013.08"
> > +DISTRO_VERSION = "2013.10"
> > +
> > +QT_PROVIDER = "qt5"
> > 
> > # SDK paths and names
> > SDK_NAME_PREFIX = "arago"
> > -- 
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

