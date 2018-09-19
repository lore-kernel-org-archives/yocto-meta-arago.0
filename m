Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C53D452A2A
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 16:13:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JGDPx0079153
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373605;
	bh=7VBFkcYDv/EXsAi9r9XQKXIGG/I9M94kTH9Zg+d/7Fw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iqY99RkVsqbjoaV4ATTmkmt92/gT9NoMHC6DfxmSwLiksvGW6WO+/674DhzOO+lIV
	t77WPbc5NVzczZOmJL8+5/pk/67+ixMxJAXvn6bbdrKPO4oxgzoPGUqwYx9IG6Y8mr
	c6E9iDqtvrmvoTTvn+bC+cXzkr9zGd6zTlpviZb4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGDP0D016916
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:13:25 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:13:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:13:25 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGDO3q013529;
	Wed, 19 Sep 2018 11:13:25 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a5237401-97cc-252e-f4ec-953d4fece1ee@ti.com>
Date: Wed, 19 Sep 2018 12:13:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3 devices
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
X-List-Received-Date: Wed, 19 Sep 2018 16:13:34 -0000
Content-Type: multipart/alternative;
	boundary="------------19BB80FBCA986ED47FB3A1B6"
Content-Language: en-US

--------------19BB80FBCA986ED47FB3A1B6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/17/2018 8:30 AM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb          | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> index 4921147..dd3407d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Task to add HMI related sources into the SDK"
>   LICENSE = "MIT"
> -PR = "r0"
> +PR = "r1"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -22,6 +22,10 @@ HMI_append_omap-a15 = " \
>       evse-hmi-src \
>   "
>   
> +HMI_append_k3 = " \
> +    evse-hmi-src \
> +"
> +
>   RDEPENDS_${PN} = "\
>       ${HMI} \
>   "


--------------19BB80FBCA986ED47FB3A1B6
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
    <div class="moz-cite-prefix">On 9/17/2018 8:30 AM, Eric Ruei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537187430-57902-1-git-send-email-e-ruei1@ti.com">
      <pre wrap="">Signed-off-by: Eric Ruei <a class="moz-txt-link-rfc2396E" href="mailto:e-ruei1@ti.com">&lt;e-ruei1@ti.com&gt;</a>
---
 .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 4921147..dd3407d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Task to add HMI related sources into the SDK"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,6 +22,10 @@ HMI_append_omap-a15 = " \
     evse-hmi-src \
 "
 
+HMI_append_k3 = " \
+    evse-hmi-src \
+"
+
 RDEPENDS_${PN} = "\
     ${HMI} \
 "
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------19BB80FBCA986ED47FB3A1B6--
