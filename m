Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3072D75BBD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:49:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4888.1732211395584559023
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 09:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1B1340C79;
	Thu, 21 Nov 2024 17:49:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxZTvqUtKa1Y; Thu, 21 Nov 2024 17:49:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B6BB40800;
	Thu, 21 Nov 2024 17:49:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E8D041640E0; Thu, 21 Nov 2024 12:49:50 -0500 (EST)
Date: Thu, 21 Nov 2024 12:49:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/scarthgap][PATCH] README:
 yocto-check-layer clean up
Message-ID: <20241121174950.GY20070@denix.org>
References: <20241121150039.6119-1-reatmon@ti.com>
 <20241121170456.GX20070@denix.org>
 <c086b98d-536b-4ca8-b001-75dd091f5fb6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c086b98d-536b-4ca8-b001-75dd091f5fb6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 17:49:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15628

On Thu, Nov 21, 2024 at 11:35:27AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 11/21/2024 11:04 AM, Denys Dmytriyenko wrote:
> >On Thu, Nov 21, 2024 at 09:00:39AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>Cleaning up the wording to pass the yocto-check-layer checks.
> >
> >Hmm, that's strange - meta-ti layers have the same wording and there are no
> >issues. Also, the new wording kind of implies that only pull requests are

s/new/old/


> >accepted, which is not true.
> 
> So fun fact, the missing word was "patch".  That's what the check
> was looking for.  That's why I just copied what meta-ti had since we
> knew it passed.

Ok, makes sense!


> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  meta-arago-demos/README  | 6 +++++-
> >>  meta-arago-distro/README | 6 +++++-
> >>  meta-arago-extras/README | 6 +++++-
> >>  meta-arago-test/README   | 6 +++++-
> >>  4 files changed, 20 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/meta-arago-demos/README b/meta-arago-demos/README
> >>index bb586c14..d10b0c1e 100644
> >>--- a/meta-arago-demos/README
> >>+++ b/meta-arago-demos/README
> >>@@ -27,7 +27,11 @@ URI: https://github.com/meta-qt5/meta-qt5
> >>  branch: master
> >>  revision: HEAD
> >>-Send pull requests to meta-arago@lists.yoctoproject.org
> >>+Send pull requests, patches, comments or questions to:
> >>+meta-arago@lists.yoctoproject.org
> >>+
> >>+Please note - meta-arago mailing list requires subscription for posting:
> >>+https://lists.yoctoproject.org/g/meta-arago
> >>  Layer maintainers:
> >>  Ryan Eatmon <reatmon@ti.com>
> >>diff --git a/meta-arago-distro/README b/meta-arago-distro/README
> >>index 49e9d9e1..50fa7ede 100644
> >>--- a/meta-arago-distro/README
> >>+++ b/meta-arago-distro/README
> >>@@ -32,7 +32,11 @@ branch: master
> >>  revision: HEAD
> >>  layers: meta-arago-extras
> >>-Send pull requests to meta-arago@lists.yoctoproject.org
> >>+Send pull requests, patches, comments or questions to:
> >>+meta-arago@lists.yoctoproject.org
> >>+
> >>+Please note - meta-arago mailing list requires subscription for posting:
> >>+https://lists.yoctoproject.org/g/meta-arago
> >>  Layer maintainers:
> >>  Ryan Eatmon <reatmon@ti.com>
> >>diff --git a/meta-arago-extras/README b/meta-arago-extras/README
> >>index 5b6e8a15..c703a813 100644
> >>--- a/meta-arago-extras/README
> >>+++ b/meta-arago-extras/README
> >>@@ -27,7 +27,11 @@ URI: https://github.com/meta-qt5/meta-qt5
> >>  branch: master
> >>  revision: HEAD
> >>-Send pull requests to meta-arago@lists.yoctoproject.org
> >>+Send pull requests, patches, comments or questions to:
> >>+meta-arago@lists.yoctoproject.org
> >>+
> >>+Please note - meta-arago mailing list requires subscription for posting:
> >>+https://lists.yoctoproject.org/g/meta-arago
> >>  Layer maintainers:
> >>  Ryan Eatmon <reatmon@ti.com>
> >>diff --git a/meta-arago-test/README b/meta-arago-test/README
> >>index 8f1f9993..16a36d62 100644
> >>--- a/meta-arago-test/README
> >>+++ b/meta-arago-test/README
> >>@@ -23,7 +23,11 @@ branch: master
> >>  revision: HEAD
> >>  layers: meta-oe, meta-networking, meta-python
> >>-Send pull requests to meta-arago@lists.yoctoproject.org
> >>+Send pull requests, patches, comments or questions to:
> >>+meta-arago@lists.yoctoproject.org
> >>+
> >>+Please note - meta-arago mailing list requires subscription for posting:
> >>+https://lists.yoctoproject.org/g/meta-arago
> >>  Layer maintainers:
> >>  Ryan Eatmon <reatmon@ti.com>
> >>-- 
> >>2.17.1

