Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3D43052A2A
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 16:14:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JGEVia079710
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373671;
	bh=IL+bDT1kKeudhCEANF50Yo46Gd2LE1wv5Yc3UKa8WQM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=tnQNKVYryx5I4B6nrvwsPddQL02LVqescB8VNGx95ZmVRmuVqKiTNGXvgI/kqTzQi
	WPIGQeIiSx433H6qbepkC2I1Ayepgnr3IievoIPNco//RvqN82QfWK2eIviP1mBDcC
	M9sAn6BDEFalKUFbRoW+6HkNoxyxidzEhsaNl/Ug=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGEVWg008132
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:14:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:14:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:14:31 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGEUT5026810;
	Wed, 19 Sep 2018 11:14:31 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1537223919-14381-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2158b781-61d5-6da3-33cb-21af1b36af99@ti.com>
Date: Wed, 19 Sep 2018 12:14:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537223919-14381-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] weston-init: add warning messages for requirement of input devices
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
X-List-Received-Date: Wed, 19 Sep 2018 16:14:42 -0000
Content-Type: multipart/alternative;
	boundary="------------AD9CAB5359739444D83E61B3"
Content-Language: en-US

--------------AD9CAB5359739444D83E61B3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/17/2018 6:38 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../recipes-graphics/wayland/weston-init.bbappend             |  2 +-
>   .../recipes-graphics/wayland/weston-init/runWeston            | 11 ++++++-----
>   2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> index 041e5ab..4ed6a62 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = ".arago7"
> +PR_append = ".arago8"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>   
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
> index aed5d5f..8bb968b 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
> @@ -18,11 +18,7 @@ cat << EOF
>   
>   
>   
> -                                        Please wait...
> -
> -
> -
> -
> +        Please wait... Weston is loading
>   
>   
>   
> @@ -30,6 +26,11 @@ cat << EOF
>   
>   
>   
> +Note: If you see that the display is stuck on this message
> +for more than 5 seconds, Weston probably failed to run.
> +Weston will not run without input devices such as
> +touchscreen or a mouse. Please check your setup and
> +attach an input device, and reboot.
>   
>   
>   


--------------AD9CAB5359739444D83E61B3
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
    <div class="moz-cite-prefix">On 9/17/2018 6:38 PM, Eric Ruei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1537223919-14381-1-git-send-email-e-ruei1@ti.com">
      <pre wrap="">Signed-off-by: Eric Ruei <a class="moz-txt-link-rfc2396E" href="mailto:e-ruei1@ti.com">&lt;e-ruei1@ti.com&gt;</a>
---
 .../recipes-graphics/wayland/weston-init.bbappend             |  2 +-
 .../recipes-graphics/wayland/weston-init/runWeston            | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 041e5ab..4ed6a62 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago7"
+PR_append = ".arago8"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
index aed5d5f..8bb968b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
@@ -18,11 +18,7 @@ cat &lt;&lt; EOF
 
 
 
-                                        Please wait...
-
-
-
-
+        Please wait... Weston is loading
 
 
 
@@ -30,6 +26,11 @@ cat &lt;&lt; EOF
 
 
 
+Note: If you see that the display is stuck on this message
+for more than 5 seconds, Weston probably failed to run.
+Weston will not run without input devices such as
+touchscreen or a mouse. Please check your setup and
+attach an input device, and reboot.
 
 
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------AD9CAB5359739444D83E61B3--
