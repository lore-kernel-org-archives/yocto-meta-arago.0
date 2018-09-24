Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7B49752079
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 13:30:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8ODUdch011559
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 08:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537795839;
	bh=9vtb7jDcbHPt/aTumzmYmRQOhOLERYgiMknoD7EAxPo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rO3A6GUCVQxFBIMxBX3ZOjaoz6Tzs+wWaqnMKctxbYWM+l6genkoLq6EH8mAXqm0S
	dYgyQla2akF2e4EUCTxuIPsNCG9YZWsHue4k6Fj6E/rBFZAiILwMmeFcqgBhsxZ/E0
	cCG8gttVmS1hhBQPelMUkgev43OJW0lqXEvZueNA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ODUcfq012365
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 08:30:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 08:30:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 08:30:38 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ODUcVR020265;
	Mon, 24 Sep 2018 08:30:38 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1537482357-6935-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0006d590-d5d6-6f5c-a819-c815cacc9b0b@ti.com>
Date: Mon, 24 Sep 2018 09:30:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537482357-6935-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master/ti2018.03] [PATCH] weston-init: add delay before starting weston when input device is not detected in time
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
X-List-Received-Date: Mon, 24 Sep 2018 13:30:50 -0000
Content-Type: multipart/alternative;
	boundary="------------F4D85EB2E143C923FCCC029F"
Content-Language: en-US

--------------F4D85EB2E143C923FCCC029F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/20/2018 6:25 PM, Hongmei Gou wrote:
> * Adding delay to work around the race condition when weston is started
>    before detection of input devices (e.g., mouse/keyboard) for EVMs without
>    touchscreen LCD
>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
>   meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 8 ++++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> index 4ed6a62..cbe0fe3 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = ".arago8"
> +PR_append = ".arago9"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>   
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> index 336e5af..461b078 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> @@ -40,6 +40,14 @@ case "$1" in
>               chmod 0700 $XDG_RUNTIME_DIR
>           fi
>   
> +        echo "Starting Weston"
> +
> +        if [ ! -d "/dev/input" ]; then
> +            echo "Waiting for input device..."
> +            killproc weston
> +            sleep 3
> +        fi
> +
>           openvt -c 4 -f runWeston
>   
>           # If there's no touchscreen device available, done


--------------F4D85EB2E143C923FCCC029F
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
    <div class="moz-cite-prefix">On 9/20/2018 6:25 PM, Hongmei Gou
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537482357-6935-1-git-send-email-a0271529@ti.com">
      <pre wrap="">* Adding delay to work around the race condition when weston is started
  before detection of input devices (e.g., mouse/keyboard) for EVMs without
  touchscreen LCD

Signed-off-by: Hongmei Gou <a class="moz-txt-link-rfc2396E" href="mailto:a0271529@ti.com">&lt;a0271529@ti.com&gt;</a>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init     | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 4ed6a62..cbe0fe3 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago8"
+PR_append = ".arago9"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 336e5af..461b078 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -40,6 +40,14 @@ case "$1" in
             chmod 0700 $XDG_RUNTIME_DIR
         fi
 
+        echo "Starting Weston"
+
+        if [ ! -d "/dev/input" ]; then
+            echo "Waiting for input device..."
+            killproc weston
+            sleep 3
+        fi
+
         openvt -c 4 -f runWeston
 
         # If there's no touchscreen device available, done
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F4D85EB2E143C923FCCC029F--
