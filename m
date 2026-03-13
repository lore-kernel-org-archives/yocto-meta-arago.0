Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C2F107BCE6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 21:10:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26378.1773436229399438484
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 14:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 87C9740BD4;
	Fri, 13 Mar 2026 21:10:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLN-1gwsMRIY; Fri, 13 Mar 2026 21:10:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37D0B40A2F;
	Fri, 13 Mar 2026 21:10:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5472F179F9C; Fri, 13 Mar 2026 17:10:24 -0400 (EDT)
Date: Fri, 13 Mar 2026 17:10:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: denys@konsulko.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2] flutter-wayland-client: patch
 build to include cstdint header file
Message-ID: <20260313211024.GV11121@denix.org>
References: <20260313203118.1128401-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313203118.1128401-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 21:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17343

On Fri, Mar 13, 2026 at 03:31:18PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Add a patch as part of the SRC. Patch includes the missing header
> file cstdint.
> 
> The patch is labeled as Inactive-Upstream, as Sony has stopped
> support for the embedded client. On the meta-flutter github,
> there are discussions on creating and maintaining a fork.
> Nothing is concrete yet.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> 
> v2: 
> - Setup dynamic layer support
> 
>  check_yocto_rules.json                        |  1 +
>  meta-arago-test/conf/layer.conf               |  1 +
>  .../flutter/flutter-wayland-client-arago.inc  |  3 +
>  .../flutter/flutter-wayland-client_%.bbappend |  5 +
>  ...-message_codec.h-Include-cstdint-lib.patch | 94 +++++++++++++++++++
>  5 files changed, 104 insertions(+)
>  create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client-arago.inc
>  create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
>  create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
> 
> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
> index 93a784b0..25c8c952 100644
> --- a/check_yocto_rules.json
> +++ b/check_yocto_rules.json
> @@ -22,6 +22,7 @@
>              "meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend",
>              "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend",
>              "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend",
> +            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend",
>              "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
>              "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
>          ]
> diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
> index 7e8bf1ab..3a5ed925 100644
> --- a/meta-arago-test/conf/layer.conf
> +++ b/meta-arago-test/conf/layer.conf
> @@ -25,6 +25,7 @@ LAYERDEPENDS_meta-arago-test = " \
>  
>  BBFILES_DYNAMIC += " \
>      qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
> +    flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.bbappend \
>  "
>  
>  # Codecs in ffmpeg with questionable patent status are not included by
> diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client-arago.inc b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client-arago.inc
> new file mode 100644
> index 00000000..ed7bd5df
> --- /dev/null
> +++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client-arago.inc
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/flutter:"
> +
> +SRC_URI:append = " file://0001-message_codec.h-Include-cstdint-lib.patch"

Use += instead of :append


> diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
> new file mode 100644
> index 00000000..58fb5497
> --- /dev/null
> +++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
> @@ -0,0 +1,5 @@
> +FLUTTER_ARAGO = ""
> +FLUTTER_ARAGO:arago = "flutter-wayland-client-arago.inc"
> +
> +require ${FLUTTER_ARAGO}
> +

Extra newline


> diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
> new file mode 100644
> index 00000000..33edda42
> --- /dev/null
> +++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
> @@ -0,0 +1,94 @@
> +From dcfcb92c7f42cd6bd92b1048b5e4ea6f01d40e21 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Tue, 10 Mar 2026 11:01:28 -0500
> +Subject: [PATCH] message_codec.h: Include cstdint lib
> +
> +Include cstdint lib within message_codec.h.
> +
> +Upstream-Status: Inactive-Upstream
> +
> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> +---
> + .../client_wrapper/include/flutter/basic_message_channel.h       | 1 +
> + .../common/client_wrapper/include/flutter/binary_messenger.h     | 1 +
> + .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
> + .../common/client_wrapper/include/flutter/message_codec.h        | 1 +
> + .../common/client_wrapper/include/flutter/method_channel.h       | 1 +
> + .../common/client_wrapper/include/flutter/method_codec.h         | 1 +
> + 6 files changed, 6 insertions(+)
> +
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
> +index c081946..fcc6b23 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
> +@@ -7,6 +7,7 @@
> +
> + #include <iostream>
> + #include <string>
> ++#include <cstdint>
> +
> + #include "binary_messenger.h"
> + #include "message_codec.h"
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
> +index d552b49..82e47da 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
> +@@ -7,6 +7,7 @@
> +
> + #include <functional>
> + #include <string>
> ++#include <cstdint>
> +
> + namespace flutter {
> +
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
> +index 3cc8b6a..9634ead 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
> +@@ -8,6 +8,7 @@
> + #include <memory>
> + #include <string>
> + #include <vector>
> ++#include <cstdint>
> +
> + #include "binary_messenger.h"
> + #include "method_codec.h"
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
> +index c84d25f..c007b1e 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
> +@@ -8,6 +8,7 @@
> + #include <memory>
> + #include <string>
> + #include <vector>
> ++#include <cstdint>
> +
> + namespace flutter {
> +
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
> +index 6e39a64..34687a6 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
> +@@ -7,6 +7,7 @@
> +
> + #include <iostream>
> + #include <string>
> ++#include <cstdint>
> +
> + #include "binary_messenger.h"
> + #include "engine_method_result.h"
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
> +index b40fa64..edd14d6 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
> +@@ -8,6 +8,7 @@
> + #include <memory>
> + #include <string>
> + #include <vector>
> ++#include <cstdint>
> +
> + #include "method_call.h"
> + #include "method_result.h"
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1

