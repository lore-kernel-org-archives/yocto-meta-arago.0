Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1D6AD52AA8
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 18:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93E2840BEA;
	Fri, 12 Mar 2021 18:54:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E-Q6frygo0mA; Fri, 12 Mar 2021 18:54:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 72D2B407DA;
	Fri, 12 Mar 2021 18:54:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D0A19174539; Fri, 12 Mar 2021 13:54:09 -0500 (EST)
Date: Fri, 12 Mar 2021 13:54:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Aparna Balasubramanian <aparnab@ti.com>
Message-ID: <20210312185409.GZ4892@denix.org>
References: <20210312161817.2581-1-aparnab@ti.com>
	<20210312163956.ti7erugzz6hcvx2m@carmaker>
	<ee3daee0-c656-fc2f-bcd2-e0734af92f22@ti.com>
MIME-Version: 1.0
In-Reply-To: <ee3daee0-c656-fc2f-bcd2-e0734af92f22@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Fri, 12 Mar 2021 18:53:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 12:48:29PM -0600, Aparna Balasubramanian wrote:
> Nishanth,
> 
> Sure, will send v2 with change information.
> 
> I will update filename as part of 2021 lts updates.

Have you rebased ltp-ddt against newer 2021 ltp version?

-- 
Denys


> Regards,
> 
> Aparna
> 
> On 3/12/21 10:39 AM, Nishanth Menon wrote:
> >On 10:18-20210312, Aparna Balasubramanian wrote:
> >
> >Can you please add change information in the commit message?
> >
> >Is this still 20200120 are'nt we in 2021?
> >>Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> >>---
> >>  .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> >>index d8eb5918..be8bea98 100644
> >>--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> >>+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> >>@@ -11,10 +11,10 @@ PROVIDES += "ltp"
> >>  DEPENDS += "alsa-lib"
> >>  PE = "1"
> >>-PR = "r11"
> >>+PR = "r12"
> >>  PV_append = "+git${SRCPV}"
> >>-SRCREV = "202913bf46e218e7c4a6d99f9833f4033cc3c17d"
> >>+SRCREV = "3543cba63326976b5fb184c88b56158e91b7626a"
> >>  BRANCH ?= "master"
> >>  SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
> >>-- 
> >>2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

