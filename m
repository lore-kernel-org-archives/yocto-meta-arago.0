Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9E10152A0E
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 16:18:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JGIodv080742
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373930;
	bh=cz3gtE51GVt8I3nnJIDJGWSEtSqW2DvQ4nxmRXRyrls=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=NOYM3LfK/U8os/O6dPxW8rOb6o0Sz1KyRiImRp4GxJ0/5Tp24kw5w6Su/R0Zfj6Yh
	/Sfev/hB1C2PTRLKVVGBdErosPJ7W0ZKE3Pojy9l5Ak/uiDt3kf/w6E1WFU4zhkf7l
	7jS/Oo+k79/ZLGRFx3LqCpmAX3q6E32oa9q0bwqU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGIoGR015259
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:18:50 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:18:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:18:50 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGInBL031944
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:18:50 -0500
To: <meta-arago@arago-project.org>
References: <1537211577-27306-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <97f337f7-751a-85fe-9122-fa3c63b48b02@ti.com>
Date: Wed, 19 Sep 2018 12:18:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537211577-27306-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH] ti-tisdk-setup: bump SRCREV to latest
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
X-List-Received-Date: Wed, 19 Sep 2018 16:18:58 -0000
Content-Type: multipart/alternative;
	boundary="------------A2FA2630C1DDC28459BE9972"
Content-Language: en-US

--------------A2FA2630C1DDC28459BE9972
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/17/2018 3:12 PM, Jacob Stiffler wrote:
> * setup: add support for Ubuntu 18.04
> * create-sdcard: fix boot image error messages
> * setup-uboot-env-am335x: run init_console while booting
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 52bb464..a79a770 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>   
> -PR = "r37"
> +PR = "r38"
>   
>   BRANCH ?= "master"
> -SRCREV = "81862f79b19bf4f312555863d247de88921a019b"
> +SRCREV = "07b6621da0e5268079071ab495a079ba0c85b32a"
>   SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git/"


--------------A2FA2630C1DDC28459BE9972
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
    <div class="moz-cite-prefix">On 9/17/2018 3:12 PM, Jacob Stiffler
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537211577-27306-1-git-send-email-j-stiffler@ti.com">
      <pre wrap="">* setup: add support for Ubuntu 18.04
* create-sdcard: fix boot image error messages
* setup-uboot-env-am335x: run init_console while booting

Signed-off-by: Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 52bb464..a79a770 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e">"file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"</a>
 
-PR = "r37"
+PR = "r38"
 
 BRANCH ?= "master"
-SRCREV = "81862f79b19bf4f312555863d247de88921a019b"
+SRCREV = "07b6621da0e5268079071ab495a079ba0c85b32a"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------A2FA2630C1DDC28459BE9972--
