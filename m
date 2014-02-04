Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 082445299C
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2014 00:51:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s140pUth022999
	for <meta-arago@arago-project.org>; Mon, 3 Feb 2014 18:51:30 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s140pUdD023827
	for <meta-arago@arago-project.org>; Mon, 3 Feb 2014 18:51:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Feb 2014 18:51:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s140pUaN004279;
	Mon, 3 Feb 2014 18:51:30 -0600
Date: Mon, 3 Feb 2014 19:51:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140204005129.GE18784@edge>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED1015993D972@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015993D972@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
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
X-List-Received-Date: Tue, 04 Feb 2014 00:51:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping

On Fri, Jan 31, 2014 at 07:50:39PM +0000, Maupin, Chase wrote:
> Mrinmayee,
> 
> Can you comment on the below need for 2.4.41?
> 
> >-----Original Message-----
> >From: Maupin, Chase
> >Sent: Friday, January 31, 2014 1:48 PM
> >To: meta-arago@arago-project.org
> >Cc: Maupin, Chase
> >Subject: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
> >
> >* The GLSDK prefers to use the 2.4.41 version of libdrm from
> >  meta-ti so pin that version in the branding file.
> >
> >Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> >---
> > .../conf/distro/include/branding-glsdk.inc         |    4 ++++
> > 1 file changed, 4 insertions(+)
> >
> >diff --git a/meta-arago-distro/conf/distro/include/branding-
> >glsdk.inc b/meta-arago-distro/conf/distro/include/branding-
> >glsdk.inc
> >index d1c30f3..b33b21d 100644
> >--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> >+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> >@@ -2,3 +2,7 @@
> >
> > # Use the SDK supported kernel and kernel version
> > PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
> >+
> >+# Set the PREFERRED_VERSION of libdrm to the glsdk version for
> >the
> >+# glsdk branded builds
> >+PREFERRED_VERSION_libdrm = "2.4.41"
> >--
> >1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

