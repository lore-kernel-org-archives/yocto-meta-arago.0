Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53851077606
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 18:46:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21791.1773859563801239411
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 11:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E317A40CCC;
	Wed, 18 Mar 2026 18:46:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nf9_GHXl7cMf; Wed, 18 Mar 2026 18:46:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9FD9140BD6;
	Wed, 18 Mar 2026 18:45:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0462E17A5BD; Wed, 18 Mar 2026 14:45:59 -0400 (EDT)
Date: Wed, 18 Mar 2026 14:45:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: reatmon@ti.com, denys@konsulko.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] flutter-samples-material-3-demo:
 Add --no-pub build option
Message-ID: <20260318184558.GM11121@denix.org>
References: <20260317210138.46226-1-a-christidis@ti.com>
 <20260317210532.GE11121@denix.org>
 <bcb06b9a-7b93-4d92-90a6-c68a757d4d1d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcb06b9a-7b93-4d92-90a6-c68a757d4d1d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 18:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17401

On Wed, Mar 18, 2026 at 10:59:51AM -0500, Antonios Christidis wrote:
> 
> On 3/17/26 4:05 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 17, 2026 at 04:01:38PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> >>From: Antonios Christidis <a-christidis@ti.com>
> >>
> >>Append "--no-pub" option to flutter.
> >>
> >>There is a patch pending upstream, [1]. The maintainer is inactive/on
> >>vacation.
> >>
> >>The upstream patch modifies a class, there is no clean way to modify
> >>a class, so I'm editing FLUTTER_BUILD_ARGS which gets consumed by the
> >>class. The end behavior is the same.
> >>
> >>[1] https://github.com/meta-flutter/meta-flutter/pull/744
> >>
> >>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >>---
> >>  check_yocto_rules.json                                        | 1 +
> >>  .../flutter/flutter-samples-material-3-demo-arago.inc         | 1 +
> >>  .../flutter/flutter-samples-material-3-demo_%.bbappend        | 4 ++++
> >>  3 files changed, 6 insertions(+)
> >>  create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc
> >>  create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend
> >>
> >>diff --git a/check_yocto_rules.json b/check_yocto_rules.json
> >>index 25c8c952..70bbe734 100644
> >>--- a/check_yocto_rules.json
> >>+++ b/check_yocto_rules.json
> >>@@ -23,6 +23,7 @@
> >>              "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend",
> >>              "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend",
> >>              "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend",
> >>+            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend",
> >>              "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
> >>              "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
> >>          ]
> >>diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc
> >>new file mode 100644
> >>index 00000000..b2c9e13d
> >>--- /dev/null
> >>+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc
> >>@@ -0,0 +1 @@
> >>+FLUTTER_BUILD_ARGS:append = " --no-pub"
> >Will it work with += here instead of :append?
> >
> It would not work, the variable has a soft default that I want to
> abide by and append to. If I use "+=" it overrides the soft default
> value.
> 
> I finally got a proper use case for ":append" lol.

Ack, thanks.


> >>diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend
> >>new file mode 100644
> >>index 00000000..f0ae3799
> >>--- /dev/null
> >>+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend
> >>@@ -0,0 +1,4 @@
> >>+FLUTTER_ARAGO = ""
> >>+FLUTTER_ARAGO:arago = "flutter-samples-material-3-demo-arago.inc"
> >>+
> >>+require ${FLUTTER_ARAGO}
> >>-- 
> >>2.34.1

