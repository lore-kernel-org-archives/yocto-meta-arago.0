Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A138D529CA
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 13:50:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HDohFZ024107
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537192243;
	bh=zMsZmE59RSREFi47Ciz5/Hs0AQbgrp7NlWGYteAPD7c=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=mcDARy6kcteP2dY1xlG3sbVWFRI2rjjHkOuuByj+QXS+Hm++43M7ibQv9p8rlF3ht
	mFY/DkRhYYOuUa7zx3vMfEpCIi7k2cgd+XcDZwyjB49heYv1xGuvD1I82Ovt/Wsbai
	I4A6a4DB2ToPazzsJIcdReuPLV0n3EaDUzAHT4Yw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDohvl017831
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:50:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:50:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 08:50:43 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDogGq002213;
	Mon, 17 Sep 2018 08:50:43 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20180914000428.112293-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <252e8a43-5cd5-46b2-3e09-c0cdead54e78@ti.com>
Date: Mon, 17 Sep 2018 09:50:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180914000428.112293-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] ocl: fix patch version in recipe
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
X-List-Received-Date: Mon, 17 Sep 2018 13:50:52 -0000
Content-Type: multipart/alternative;
	boundary="------------5414F70B1DC7B396F7A1E301"
Content-Language: en-US

--------------5414F70B1DC7B396F7A1E301
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/13/2018 8:04 PM, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index b4883c26..c2dc4002 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,6 @@
> -PV = "1.1.16.0"
> -INC_PR = "r0"
> +# patch version at the end needs to be in double digits
> +PV = "1.1.16.00"
> +INC_PR = "r1"
>   
>   LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
>   


--------------5414F70B1DC7B396F7A1E301
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
    <div class="moz-cite-prefix">On 9/13/2018 8:04 PM, Yuan Zhao wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180914000428.112293-1-yuanzhao@ti.com">
      <pre wrap="">Signed-off-by: Yuan Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yuanzhao@ti.com">&lt;yuanzhao@ti.com&gt;</a>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index b4883c26..c2dc4002 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,5 +1,6 @@
-PV = "1.1.16.0"
-INC_PR = "r0"
+# patch version at the end needs to be in double digits
+PV = "1.1.16.00"
+INC_PR = "r1"
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff">"file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"</a>
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5414F70B1DC7B396F7A1E301--
