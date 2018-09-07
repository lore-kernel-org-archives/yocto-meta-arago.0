Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9336B52982
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 13:19:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87DJ3u7121118
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 08:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536326343;
	bh=WyjNLOEaWiuuC634TJZR/oGfqNy4pAFviaGBlXqxqvU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=E5HzrUIwVGn3V6vhx9odGU6PN2XzIdUnaQV2ROrvf7dSaZSmzIXOW9HjEz5kJttWz
	n3xSZAY0yx2b5GmBmxEd6pqF2UEaaZ4/sjN55/7Ag9xS6/BW8AEASnvYyH7VoGxPhw
	ZfByERb1A19nTB56i47Z7lFFgW3zpbsg+wC9icTw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87DJ3Ch005808
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 08:19:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 08:19:02 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 08:19:02 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87DJ2Il032351;
	Fri, 7 Sep 2018 08:19:02 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1536267851-5510-1-git-send-email-a0271529@ti.com>
	<1536267851-5510-2-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bd502465-6873-8838-b679-d00969bb198f@ti.com>
Date: Fri, 7 Sep 2018 09:19:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536267851-5510-2-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 1/5] pru-icss: install header files and rpmsg_lib
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
X-List-Received-Date: Fri, 07 Sep 2018 13:19:12 -0000
Content-Type: multipart/alternative;
	boundary="------------FEECCC619E40ED04B6708988"
Content-Language: en-US

--------------FEECCC619E40ED04B6708988
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

I am not sure if we should upstream this, add it to meta-processor-sdk, 
or leave pru-icss untouched and adjust "PRU_SSP" in the next patch to 
point to the original install location.

- Jake

On 9/6/2018 5:04 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-bsp/pru/pru-icss_git.bbappend | 8 ++++++++
>   1 file changed, 8 insertions(+)
>   create mode 100644 recipes-bsp/pru/pru-icss_git.bbappend
>
> diff --git a/recipes-bsp/pru/pru-icss_git.bbappend b/recipes-bsp/pru/pru-icss_git.bbappend
> new file mode 100644
> index 0000000..cb56e38
> --- /dev/null
> +++ b/recipes-bsp/pru/pru-icss_git.bbappend
> @@ -0,0 +1,8 @@
> +PR_append = ".tisdk0"
> +
> +do_install_append() {
> +    install -d ${D}${includedir}
> +    cp -r ${S}/include/* ${D}${includedir}
> +    install -d ${D}${libdir}
> +    cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
> +}


--------------FEECCC619E40ED04B6708988
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I am not sure if we should upstream this, add it to
      meta-processor-sdk, or leave pru-icss untouched and adjust "<span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times
        New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
        EN-US;mso-bidi-language:AR-SA">PRU_SSP" in the next patch to
        point to the original install location.<br>
      </span></p>
    - Jake<br>
    <br>
    <div class="moz-cite-prefix">On 9/6/2018 5:04 PM, Hongmei Gou wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1536267851-5510-2-git-send-email-a0271529@ti.com">
      <pre wrap="">Signed-off-by: Hongmei Gou <a class="moz-txt-link-rfc2396E" href="mailto:a0271529@ti.com">&lt;a0271529@ti.com&gt;</a>
---
 recipes-bsp/pru/pru-icss_git.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 recipes-bsp/pru/pru-icss_git.bbappend

diff --git a/recipes-bsp/pru/pru-icss_git.bbappend b/recipes-bsp/pru/pru-icss_git.bbappend
new file mode 100644
index 0000000..cb56e38
--- /dev/null
+++ b/recipes-bsp/pru/pru-icss_git.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".tisdk0"
+
+do_install_append() {
+    install -d ${D}${includedir}
+    cp -r ${S}/include/* ${D}${includedir}
+    install -d ${D}${libdir}
+    cp ${S}/lib/rpmsg_lib.lib ${D}${libdir}
+}
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FEECCC619E40ED04B6708988--
