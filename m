Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6AD4D529CA
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 13:49:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HDnCRk029328
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537192152;
	bh=C1g4ZwB5NiKc1dnwP1ZU4q7m0xIvkfZ2V2+v1R7Q5Og=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=FzQk0reI0kF+NWimXXAySAzWnrjGFxRPyl4d+5NA0bCW+oeBtjPkQ92K0uiw0NrMS
	W6DvDgQ7ZFvLRUXo1X/lOUX2ThXF1Vdcw/kD04YxHkerp8qEbmAX4f8CK8AY+8wZjb
	JNgGLFaRyBgAGKuRPZVsXStSyHNO4WRYF//9TdAE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDnC2t014804
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:49:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:49:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 08:49:11 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDnBZV032519;
	Mon, 17 Sep 2018 08:49:11 -0500
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
References: <1536767529-46653-1-git-send-email-e-ruei1@ti.com>
	<20180912194850.GC12296@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ef9362d8-3b83-b386-7b34-2b89448d8945@ti.com>
Date: Mon, 17 Sep 2018 09:49:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180912194850.GC12296@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] Re: [PATCH] matrix-gui-qt5-demos:remove the extra .pc directory under matrix-gui/apps for k3 devices
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
X-List-Received-Date: Mon, 17 Sep 2018 13:49:21 -0000
Content-Type: multipart/alternative;
	boundary="------------8FE35C5B5BCBACF9479268C9"
Content-Language: en-US

--------------8FE35C5B5BCBACF9479268C9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport the "revert" to ti2018.03?


Thank you,

Jake


On 9/12/2018 3:48 PM, Denys Dmytriyenko wrote:
> This package is allarch - you cannot do machine overrides. BTW, your previous
> change for qtwebkit patching is also incorrect - I'll revert it.
>
>
> On Wed, Sep 12, 2018 at 11:52:09AM -0400, Eric Ruei wrote:
>> Note: the .pc directory is created due to the k3 patch
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
>> index 2401832..6241bbf 100644
>> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>>   
>>   require matrix-gui-apps-git.inc
>>   
>> -PR = "${INC_PR}.1"
>> +PR = "${INC_PR}.2"
>>   
>>   inherit allarch
>>   
>> @@ -13,6 +13,11 @@ SRC_URI_append_k3 = " \
>>   
>>   S = "${WORKDIR}/git/qt5_apps"
>>   
>> +do_install_append_k3(){
>> +    rm -r ${D}${MATRIX_APP_DIR}/.pc
>> +}
>> +
>> +
>>   # Make sure qt5 submenu and app images has been installed
>>   RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
>>   
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------8FE35C5B5BCBACF9479268C9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport the "revert" to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/12/2018 3:48 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20180912194850.GC12296@beryl">
      <pre wrap="">This package is allarch - you cannot do machine overrides. BTW, your previous 
change for qtwebkit patching is also incorrect - I'll revert it.


On Wed, Sep 12, 2018 at 11:52:09AM -0400, Eric Ruei wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Note: the .pc directory is created due to the k3 patch

Signed-off-by: Eric Ruei <a class="moz-txt-link-rfc2396E" href="mailto:e-ruei1@ti.com">&lt;e-ruei1@ti.com&gt;</a>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
index 2401832..6241bbf 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps">"https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"</a>
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit allarch
 
@@ -13,6 +13,11 @@ SRC_URI_append_k3 = " \
 
 S = "${WORKDIR}/git/qt5_apps"
 
+do_install_append_k3(){
+    rm -r ${D}${MATRIX_APP_DIR}/.pc
+}
+
+
 # Make sure qt5 submenu and app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
 
-- 
1.9.1

_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
      </blockquote>
      <pre wrap="">_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------8FE35C5B5BCBACF9479268C9--
