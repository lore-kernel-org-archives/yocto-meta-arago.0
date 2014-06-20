Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9E05C52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:15:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJFWF4027799;
	Fri, 20 Jun 2014 14:15:32 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJFWIv009757;
	Fri, 20 Jun 2014 14:15:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Jun 2014 14:15:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJFVGg022867;
	Fri, 20 Jun 2014 14:15:31 -0500
Date: Fri, 20 Jun 2014 15:15:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140620191530.GD1825@edge>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-15-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9475@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D9475@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 14/19] toolchain-external: bb.which() is not part of bb.utils module
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
X-List-Received-Date: Fri, 20 Jun 2014 19:15:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Good catch, indeed.


On Fri, Jun 20, 2014 at 07:10:37PM +0000, Maupin, Chase wrote:
> Do you mean is "now" part of bb.utils module?
> 
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 14/19] toolchain-external: bb.which()
> >is not part of bb.utils module
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/conf/distro/include/toolchain-external.inc | 2
> >+-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> >external.inc b/meta-arago-distro/conf/distro/include/toolchain-
> >external.inc
> >index 5356082..4d14c00 100644
> >--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
> >+++ b/meta-arago-distro/conf/distro/include/toolchain-external.inc
> >@@ -1,4 +1,4 @@
> > # Locate the toolchain automatically from PATH
> >-TOOLCHAIN_SYSPATH :=
> >"${@os.path.abspath(os.path.dirname(bb.which(d.getVar('PATH', d,
> >1), d.getVar('TOOLCHAIN_PREFIX', d,
> >1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
> >+TOOLCHAIN_SYSPATH :=
> >"${@os.path.abspath(os.path.dirname(bb.utils.which(d.getVar('PATH'
> >, d, 1), d.getVar('TOOLCHAIN_PREFIX', d,
> >1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
> > TOOLCHAIN_PATH := "${@bool(d.getVar('TOOLCHAIN_SYSPATH', d, 1))
> >and (os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and
> >os.path.dirname(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) or
> >bb.fatal('No valid toolchain in PATH')) or ''}"
> > EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
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

