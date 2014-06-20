Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AB191529D7
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:08:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ8pVB030027;
	Fri, 20 Jun 2014 14:08:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ8oJQ003834;
	Fri, 20 Jun 2014 14:08:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Jun 2014 14:08:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ8oWo019199;
	Fri, 20 Jun 2014 14:08:50 -0500
Date: Fri, 20 Jun 2014 15:08:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140620190849.GA1825@edge>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-3-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9033@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D9033@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 02/19] linux-libc-headers: remove old 2.6.37	version
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
X-List-Received-Date: Fri, 20 Jun 2014 19:08:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, 2.6 is just completely and utterly broken with newer toolchains, newer 
udev and newer kmod. Nothing builds anymore... I'll update commit message.


On Fri, Jun 20, 2014 at 07:04:49PM +0000, Maupin, Chase wrote:
> I'm assuming this is because the legacy machines line am180x are moving to 
> using the mainline kernel?  A more detailed commit message explaining this 
> move would help.  Aside from that:
> 
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 02/19] linux-libc-headers: remove old
> >2.6.37 version
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../linux-libc-headers/linux-libc-headers_2.6.37.2.bb          |
> >10 ----------
> > 1 file changed, 10 deletions(-)
> > delete mode 100644 meta-arago-extras/recipes-kernel/linux-libc-
> >headers/linux-libc-headers_2.6.37.2.bb
> >
> >diff --git a/meta-arago-extras/recipes-kernel/linux-libc-
> >headers/linux-libc-headers_2.6.37.2.bb b/meta-arago-
> >extras/recipes-kernel/linux-libc-headers/linux-libc-
> >headers_2.6.37.2.bb
> >deleted file mode 100644
> >index 5c00af5..0000000
> >--- a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-
> >libc-headers_2.6.37.2.bb
> >+++ /dev/null
> >@@ -1,10 +0,0 @@
> >-require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> >-
> >-FILESEXTRAPATHS_append :=
> >"${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-
> >headers/${PN}"
> >-
> >-PR = "r1"
> >-
> >-SRC_URI += " file://connector-msg-size-fix.patch"
> >-SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
> >-SRC_URI[sha256sum] =
> >"2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
> >-
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

