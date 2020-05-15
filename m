Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EF96052979
	for <meta-arago@arago-project.org>;
	Fri, 15 May 2020 19:11:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FJ9RRa118729
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 14:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589569767;
	bh=OOLaGbqMKALylOXrRSoc4dj4dAbfGvMqvQXVbgLsOV0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=rvElHjIp/oS3U6wj3jm4uzmOM3RoHKngQRrI+fXDZa2ujrDxJVSR9A3xejHxvLBHG
	IZk6StKMGNZ7YVpqP30PT7X+D9Sf2kx9I4ooNeAnX6MDCt0i9ATDiWcZ/iKt2aNjYu
	i/K9hlhAERTmnLFZxgvvza2MFBbj63Z0T6q96PIg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04FJ9QvJ038100
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 14:09:27 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 15 May 2020 14:09:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 15 May 2020 14:09:26 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FJ9Oq1111501;
	Fri, 15 May 2020 14:09:25 -0500
To: Denys Dmytriyenko <denys@ti.com>, <prao@ti.com>
References: <20200515184439.3339-1-prao@ti.com> <20200515184605.GG8594@beryl>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <d15f1b3d-04c0-427f-8525-d733886a78ca@ti.com>
Date: Sat, 16 May 2020 00:39:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515184605.GG8594@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH] packagegroup: Add ti-sci-fw-src to tisdk-addons-sdk-host
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
X-List-Received-Date: Fri, 15 May 2020 19:11:53 -0000
Content-Type: multipart/alternative;
	boundary="------------CD3C2940B7A6252B5A62F2DC"
Content-Language: en-US

--------------CD3C2940B7A6252B5A62F2DC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

On 16/05/20 12:16 am, Denys Dmytriyenko wrote:
> Have you even tried it yourself?
>
Praveen has been debugging some issue where the source package for 
ti-sci-fw is not included in the installer.
I asked him to check in the packagegroup-arago-tisdk-addons-sdk-host.bb 
and he found it was missing

Is this dropped for some reason?
Also, now shall we rename SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 to 
board-support/k3-image-gen-${PV} ?

Regards,
Nikhil D
> On Sat, May 16, 2020 at 12:14:39AM +0530, prao@ti.com wrote:
>> From: Praveen Rao <prao@ti.com>
>>
>> Add source package for k3 image gen in the tisdk-addons-sdk-host
>>
>> Signed-off-by: Praveen Rao <prao@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> index 6dcb253c..32d6c98b 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> @@ -38,6 +38,7 @@ UTILS_append_k2g = " \
>>   
>>   UTILS_append_k3 = " \
>>       jailhouse-src \
>> +    ti-sci-fw-src \
>>       arm-trusted-firmware-src \
>>   "
>>   
>> -- 
>> 2.17.1
>>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------CD3C2940B7A6252B5A62F2DC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Denys,<br>
    <br>
    <div class="moz-cite-prefix">On 16/05/20 12:16 am, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200515184605.GG8594@beryl">
      <pre class="moz-quote-pre" wrap="">Have you even tried it yourself?

</pre>
    </blockquote>
    Praveen has been debugging some issue where the source package for
    ti-sci-fw is not included in the installer.<br>
    I asked him to check in the 
    packagegroup-arago-tisdk-addons-sdk-host.bb and he found it was
    missing<br>
    <br>
    Is this dropped for some reason?<br>
    Also, now shall we rename SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 to
    board-support/k3-image-gen-${PV} ?<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type="cite" cite="mid:20200515184605.GG8594@beryl">
      <pre class="moz-quote-pre" wrap="">
On Sat, May 16, 2020 at 12:14:39AM +0530, <a class="moz-txt-link-abbreviated" href="mailto:prao@ti.com">prao@ti.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Praveen Rao <a class="moz-txt-link-rfc2396E" href="mailto:prao@ti.com">&lt;prao@ti.com&gt;</a>

Add source package for k3 image gen in the tisdk-addons-sdk-host

Signed-off-by: Praveen Rao <a class="moz-txt-link-rfc2396E" href="mailto:prao@ti.com">&lt;prao@ti.com&gt;</a>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 6dcb253c..32d6c98b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -38,6 +38,7 @@ UTILS_append_k2g = " \
 
 UTILS_append_k3 = " \
     jailhouse-src \
+    ti-sci-fw-src \
     arm-trusted-firmware-src \
 "
 
-- 
2.17.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CD3C2940B7A6252B5A62F2DC--
