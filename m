Return-Path: <burakozbek@buyutech.com.tr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434B9CAC589
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 07:59:42 +0000 (UTC)
Subject: populate_sdk_ext task fails on Processor SDK (Scarthgap 11.01.05.03) with bpftool recipe QA error
To: meta-arago@lists.yoctoproject.org
From: burakozbek@buyutech.com.tr
X-Originating-Location: =?UTF-8?B?w4dhbmtheWEsIEFua2FyYSwgVFI=?= (81.215.13.113)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Sep 2025 00:59:40 -0700
Message-ID: <gfEt.1757404780531603233.440p@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Sep 2025 07:59:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16553

Hello,

I successfully built the tisdk-default-image on Processor SDK Linux Scarthg=
ap 11.01.05.03 (processor-sdk-scarthgap-11.01.05.03-config).

However, when I run the following command to generate the extensible SDK:
bitbake -k tisdk-default-image -c populate_sdk_ext

I encounter the following error at the end of the build process:
.../tisdk/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-defa=
ult-image/1.0/sdk-ext/image/tmp-renamed-sdk/layers/meta-openembedded/meta-o=
e/recipes-kernel/bpftool/bpftool.bb:do_recipe_qa) failed with exit code 'se=
tscene ignore_tasks'

Board: AM62xx EVM
SDK Version: Processor SDK Linux Scarthgap 11.01.05.03
Image: tisdk-default-image
Could you please help me understand what this error means and how I can res=
olve it?

Thanks in advance!

