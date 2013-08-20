Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0F389529DA
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 16:23:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KGNexC026125
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 11:23:40 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KGNefE003402
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 11:23:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 11:23:40 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KGNeIT013763;
	Tue, 20 Aug 2013 11:23:40 -0500
Date: Tue, 20 Aug 2013 12:23:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130820162339.GB8481@edge>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
	<20130819213613.GF32524@denix.org>
	<FC0CCC2B-AE0D-4AA7-B553-3379ED7A62F0@ti.com>
MIME-Version: 1.0
In-Reply-To: <FC0CCC2B-AE0D-4AA7-B553-3379ED7A62F0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master & danny][PATCH 1/7] linux-libc-headers: Add linux-libc-headers version 2.6.33
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
X-List-Received-Date: Tue, 20 Aug 2013 16:23:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 19, 2013 at 10:30:20PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> On Aug 19, 2013, at 4:36 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Wed, Jul 31, 2013 at 07:31:46PM -0500, Franklin S. Cooper Jr wrote:
> >> * This is the version that was originally being using in arago/oe-classic based
> >>  SDK.
> > 
> > Why do we need 2.6.33? All our old kernels are at least 2.6.37 now and there 
> > is corresponding linux-libc-headers available...

> It's been awhile but I believe am18x still didn't like the 2.6.37 headers 
> for some crazy reason.

Do you have any more details? I'm testing it right now and it seems to be 
building fine so far against 2.6.37.2...

-- 
Denys


> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../linux-libc-headers_2.6.33.bb                   |   10 ++++++++++
> >> 1 files changed, 10 insertions(+), 0 deletions(-)
> >> create mode 100644 meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
> >> 
> >> diff --git a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
> >> new file mode 100644
> >> index 0000000..eb8cb19
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
> >> @@ -0,0 +1,10 @@
> >> +require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> >> +
> >> +FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-headers/${PN}"
> >> +
> >> +PR = "r0"
> >> +
> >> +SRC_URI += " file://connector-msg-size-fix.patch"
> >> +SRC_URI[md5sum] = "c3883760b18d50e8d78819c54d579b00"
> >> +SRC_URI[sha256sum] = "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5c6"
> >> +
> >> -- 
> >> 1.7.0.4
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> 

