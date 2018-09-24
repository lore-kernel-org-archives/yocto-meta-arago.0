Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1AC7C529AF
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 13:30:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8ODUmxu011598
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 08:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537795848;
	bh=M1BGodtz4zlafRdF7Lw+LoyVD8dRURdrBEXTf2s0OoQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=NqeF8UybeOw+6eEUS/HteT/6spoPL+tjl1PTWUIRjHC4GrzimhlgoGRtLpYtUI11k
	rZH1sLIRiP1qvQ4LtUfhIfCjM6ctyBVNPlczy45QnxRpeIs6a/utxEG/jnp7AqMZR3
	wmT12Tza3WMlZr2zzBrfdobOEWVJluZ0kOL20Yzo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ODUmqZ012686
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 08:30:48 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 08:30:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 08:30:48 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ODUmCl006555;
	Mon, 24 Sep 2018 08:30:48 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1537482954-13164-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8f7fdddc-c989-6e98-e281-b4036b178950@ti.com>
Date: Mon, 24 Sep 2018 09:30:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537482954-13164-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master/ti2018.03] [PATCH] matrix-gui-apps-git: bump SRCREV
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
X-List-Received-Date: Mon, 24 Sep 2018 13:30:57 -0000
Content-Type: multipart/alternative;
	boundary="------------E86D3FA1E0E9D5CF8092FDCC"
Content-Language: en-US

--------------E86D3FA1E0E9D5CF8092FDCC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/20/2018 6:35 PM, Hongmei Gou wrote:
> * Script change for dsp66_multimedia_imgproc_f2f demo
>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index a5da492..b998e73 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>   
>   SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "28aa0adb7733f103e07d82123924c5a6d1a9bfeb"
> +SRCREV = "4d84d7a993e525e5bcff781d4536c7eb5e2bf106"
>   BRANCH = "master"
> -INC_PR = "r58"
> +INC_PR = "r59"
>   
>   # Pull in the base package for installing matrix applications
>   require matrix-gui-apps.inc


--------------E86D3FA1E0E9D5CF8092FDCC
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
    <div class="moz-cite-prefix">On 9/20/2018 6:35 PM, Hongmei Gou
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537482954-13164-1-git-send-email-a0271529@ti.com">
      <pre wrap="">* Script change for dsp66_multimedia_imgproc_f2f demo

Signed-off-by: Hongmei Gou <a class="moz-txt-link-rfc2396E" href="mailto:a0271529@ti.com">&lt;a0271529@ti.com&gt;</a>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index a5da492..b998e73 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := <a class="moz-txt-link-rfc2396E" href="file://../${LICENSE_CHECKSUM}">"file://../${LICENSE_CHECKSUM}"</a>
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "28aa0adb7733f103e07d82123924c5a6d1a9bfeb"
+SRCREV = "4d84d7a993e525e5bcff781d4536c7eb5e2bf106"
 BRANCH = "master"
-INC_PR = "r58"
+INC_PR = "r59"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------E86D3FA1E0E9D5CF8092FDCC--
