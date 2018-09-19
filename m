Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7E2A452A0E
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 16:18:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JGHuZW080564
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373876;
	bh=Jkn/8sM4yO8JG7lB7Rvr6V0S687kC/8KQhFNhKXnl4k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BuN+yHzbmfX8o46+8R7jwPeV0S0LgJ/P3rP0jujPsSY+Tf1HW7SrMQLk6xlQAyVUl
	xk2OGeJPS1drgcUk0UBc53WGXazx+k73Qc5gPUEr9tBvTnt1z3HvMXVnnXcQGMCsLL
	z41g2/vtdXdCP8V8AsY+HPJC7MqpZhZt0OAKWgVU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGHucf013983
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:17:56 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:17:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:17:56 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGHtIA010149
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:17:55 -0500
To: <meta-arago@arago-project.org>
References: <1537202512-20914-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8afc7f82-4c5a-cda3-2414-2c673d9ffe32@ti.com>
Date: Wed, 19 Sep 2018 12:17:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537202512-20914-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: add iperf3
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
X-List-Received-Date: Wed, 19 Sep 2018 16:18:04 -0000
Content-Type: multipart/alternative;
	boundary="------------2AB28C091D91A37B53FD76D5"
Content-Language: en-US

--------------2AB28C091D91A37B53FD76D5
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/17/2018 12:41 PM, Jacob Stiffler wrote:
> * Add iperf3 in addition to iperf as each have benefits
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb          | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 113b7ad..57f6707 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -19,6 +19,7 @@ RDEPENDS_${PN} = "\
>       libpcre \
>       iptables \
>       iperf \
> +    iperf3 \
>       arago-gpl-notice \
>       arago-feed-config \
>       nfs-utils-client \


--------------2AB28C091D91A37B53FD76D5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/17/2018 12:41 PM, Jacob Stiffler
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537202512-20914-1-git-send-email-j-stiffler@ti.com">
      <pre wrap="">* Add iperf3 in addition to iperf as each have benefits

Signed-off-by: Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 113b7ad..57f6707 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -19,6 +19,7 @@ RDEPENDS_${PN} = "\
     libpcre \
     iptables \
     iperf \
+    iperf3 \
     arago-gpl-notice \
     arago-feed-config \
     nfs-utils-client \
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2AB28C091D91A37B53FD76D5--
