Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C15EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:56:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.208.1687877795943618949
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lp97mGvA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35REuTw3009974;
	Tue, 27 Jun 2023 09:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687877789;
	bh=wrYJcGy/ztfl2IbXNYJFhxpqnbImVBbuMrWmltotagk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lp97mGvAkKErOhIn7m/YXA77pbgd3t9x6QtVC4GIy0cehi1QPnzsdlr+S6tk4qTru
	 sSxngz2/zL4VDsixaBGl7mINsh8ANsM/1G5Uv5pes2GgI1IXsCCGE/f4s02nj7yrmP
	 B1f27/4HPgycSx6PNotNeXUo/NXqD8BpOLXm11ik=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35REuTNW042183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:56:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:56:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:56:29 -0500
Received: from [10.250.37.10] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35REuSWJ018729;
	Tue, 27 Jun 2023 09:56:28 -0500
Message-ID: <c8e53b03-5d6d-1e74-7d06-880ee1da4f44@ti.com>
Date: Tue, 27 Jun 2023 09:56:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v4 2/8] meta-arago-extras: sysrepo: Add
 libssh recipe needed for sysrepo
To: Ravi Gunasekaran <r-gunasekaran@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-3-r-gunasekaran@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230627144249.30543-3-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14715

On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
> libnetconf2 is needed to build sysrepo. And libnetconf2 depends on
> libssh. So add receipe for libssh.
> 

What is wrong with the version of libssh already in meta-oe?

Andrew

> The recipe is taken as-is from the commit 09f73e7 ("update for honister")
> from the public repo [1].
> 
> [1] - https://github.com/sartura/meta-sysrepo
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> 
> Changes since v3:
> ----------------
> No change
> 
> Changes since v2:
> ---------------
> Newly introduced in this series
> 
>   .../recipes-sysrepo/libssh/libssh_0.9.5.bb    | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> new file mode 100644
> index 00000000..43a6827e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
> +HOMEPAGE = "http://www.libssh.org"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
> +
> +DEPENDS = "zlib openssl"
> +
> +SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.9"
> +SRCREV = "0cceefd49d4d397eb21bd36e314ac87739da51ff"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +PACKAGECONFIG ??=""
> +PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
> +
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +
> +EXTRA_OECMAKE = " \
> +    -DWITH_GCRYPT=0 \
> +    -DWITH_PCAP=1 \
> +    -DWITH_SFTP=1 \
> +    -DWITH_ZLIB=1 \
> +    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
> +    "
> +
> +do_configure:prepend () {
> +    # Disable building of examples
> +    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
> +        || bbfatal "Failed to disable examples"
> +}
> +
> +TOOLCHAIN = "gcc"

