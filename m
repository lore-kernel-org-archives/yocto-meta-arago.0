Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 40EB152094
	for <meta-arago@arago-project.org>;
	Thu, 20 Sep 2018 16:23:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8KGNaTF041524
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 11:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537460616;
	bh=D5i4fj5Y5ZfjEq2KMdn+5aOJ+6i56THUXtUzYDypFZA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MyO1G2wL54RFQS40yAN52jZ17XPsWmDDruM6V1nOyj31QqFulbtcQc2Sk5xek3KoE
	NF8F8vvkBpYO32KUdICcoQVkVgm41ReonBkXHH+tH45fK83AnycWSOy5AZEHXH80pw
	pIPRerbBFk6WdbQrYzslv/lUlPqgZxgSEGrVcGRA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8KGNa6v013034
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 11:23:36 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 20 Sep 2018 11:23:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 20 Sep 2018 11:23:36 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8KGNZJ0010610
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 11:23:35 -0500
To: <meta-arago@arago-project.org>
References: <1537292712-26890-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <66650fd1-f24e-4783-d866-06353948616c@ti.com>
Date: Thu, 20 Sep 2018 12:23:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537292712-26890-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH] packagegroup-arago-tisdk-matrix: k3: remove PM demos
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
X-List-Received-Date: Thu, 20 Sep 2018 16:23:50 -0000
Content-Type: multipart/alternative;
	boundary="------------E86053811C80AB12044CB344"
Content-Language: en-US

--------------E86053811C80AB12044CB344
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/18/2018 1:45 PM, Jacob Stiffler wrote:
> * The scaling governor is  not supported on k3
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 919bd41..cf91688 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to include Matrix v2"
>   LICENSE = "MIT"
> -PR = "r73"
> +PR = "r74"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -147,10 +147,6 @@ MATRIX_APPS_append_k3 = "           \
>       matrix-multimedia-demo-mpeg4aacdec \
>       matrix-multimedia-demo-mpeg4dec \
>                                       \
> -    matrix-gui-generic-pm           \
> -    matrix-gui-clocks               \
> -    matrix-gui-pm-demos-governor    \
> -                                    \
>       matrix-hmi-demo-evse            \
>                                       \
>       ${MATRIX_OPENCV_ARM_ONLY_APPS}  \


--------------E86053811C80AB12044CB344
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
    <div class="moz-cite-prefix">On 9/18/2018 1:45 PM, Jacob Stiffler
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537292712-26890-1-git-send-email-j-stiffler@ti.com">
      <pre wrap="">* The scaling governor is  not supported on k3

Signed-off-by: Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 919bd41..cf91688 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r73"
+PR = "r74"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -147,10 +147,6 @@ MATRIX_APPS_append_k3 = "           \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
-    matrix-gui-generic-pm           \
-    matrix-gui-clocks               \
-    matrix-gui-pm-demos-governor    \
-                                    \
     matrix-hmi-demo-evse            \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------E86053811C80AB12044CB344--
