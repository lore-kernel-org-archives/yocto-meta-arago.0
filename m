Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E15DE52A1C
	for <meta-arago@arago-project.org>;
	Wed,  1 Jul 2020 08:38:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0618Zvop059224
	for <meta-arago@arago-project.org>; Wed, 1 Jul 2020 03:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593592557;
	bh=T7z3S/W8z0rPjRE/jE95njvA0jUJcjB8Ns0k5z/j1ts=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=GNK/ZVIhHF0ts9IDd87lhELog6SyAPQ3NAT3xOIjuOCDU6WdWrP+RB9AzXBAu5NO4
	LhT+m9avLpQx5qmgcc5RK+TxQkfB8yRx/lXBHFMbJJYu47O9WX7pU56Nto030xm9On
	WNBwFKUWtW2vaEMx2iK3tY81XWMCFAJFkrA537sg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0618ZutO009324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 1 Jul 2020 03:35:56 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 1 Jul 2020 03:35:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 1 Jul 2020 03:35:56 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0618Zsnt004382;
	Wed, 1 Jul 2020 03:35:55 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20200630170717.27124-1-nikhil.nd@ti.com>
	<20200630171518.GJ7211@beryl>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <e51fad35-1545-f9fa-0794-72b31dc4a9bd@ti.com>
Date: Wed, 1 Jul 2020 14:05:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630171518.GJ7211@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, prao@ti.com
Subject: Re: [master/dunfell] packagegroup: tisdk-addons-sdk-host: Include gpu driver source based on MACHINE_FEATURES
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
X-List-Received-Date: Wed, 01 Jul 2020 08:38:35 -0000
Content-Type: multipart/alternative;
	boundary="------------EE83243361186869A25D76AD"
Content-Language: en-US

--------------EE83243361186869A25D76AD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/20 10:45 pm, Denys Dmytriyenko wrote:
> On Tue, Jun 30, 2020 at 10:37:17PM +0530, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Check for gpu in MACHINE_FEATURES and include the source package
>> for img rogue driver for j7-evm
> This shouldn't be needed:
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb;hb=HEAD#l12
Thanks. Got it.
I will include the graphics-sdk-host packagegroup in my bundle.
Drop this patch

Nikhil D
>
>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> index adfcfa3e..7200e9f2 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> @@ -43,6 +43,7 @@ UTILS_append_k3 = " \
>>   "
>>   
>>   UTILS_append_j7 = " \
>> +    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'ti-img-rogue-driver-src', '', d)} \
>>       pru-icss-src \
>>   "
>>   
>> -- 
>> 2.17.1
>>


--------------EE83243361186869A25D76AD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 30/06/20 10:45 pm, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171518.GJ7211@beryl">
      <pre class="moz-quote-pre" wrap="">On Tue, Jun 30, 2020 at 10:37:17PM +0530, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

Check for gpu in MACHINE_FEATURES and include the source package
for img rogue driver for j7-evm
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This shouldn't be needed:
<a class="moz-txt-link-freetext" href="http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb;hb=HEAD#l12">http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb;hb=HEAD#l12</a></pre>
    </blockquote>
    Thanks. Got it.<br>
    I will include the graphics-sdk-host packagegroup in my bundle.<br>
    Drop this patch<br>
    <br>
    Nikhil D<br>
    <blockquote type="cite" cite="mid:20200630171518.GJ7211@beryl">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index adfcfa3e..7200e9f2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -43,6 +43,7 @@ UTILS_append_k3 = " \
 "
 
 UTILS_append_j7 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'ti-img-rogue-driver-src', '', d)} \
     pru-icss-src \
 "
 
-- 
2.17.1

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------EE83243361186869A25D76AD--
