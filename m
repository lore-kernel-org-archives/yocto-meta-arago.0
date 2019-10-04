Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8F47F520DF
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2019 10:00:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x949xTK7034931
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2019 04:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570183169;
	bh=lbXVcY1lub216oerscIxqbIQ3oLiVLeBkOa5uylp6WQ=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=h+dnQzJslvbgpZFRAz/o0j4Ekjpsc00w8i0lr5BnfyZkp1P7vyfM6J4iMeYxUamWt
	9Myg+x1cjoFjxoLFwL0MiWIounymyuqI6Y7IZAFpEP9rqup6Sz/RjqMpob/juDARvu
	cs26IpkqS85lleeviQxazbEukc9VPhCM/BSgc+Jc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x949xT4W099706
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2019 04:59:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 4 Oct 2019 04:59:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 4 Oct 2019 04:59:29 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x949xRbY080549;
	Fri, 4 Oct 2019 04:59:28 -0500
From: Nikhil Devshatwar <a0132237@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>, 
	<meta-arago@arago-project.org>
References: <1569933857-77302-1-git-send-email-nikhil.nd@ti.com>
	<af60f4cc-3500-8e8f-54f9-c06c1df1e704@ti.com>
	<85cae64f-4bad-de7f-1a73-9c074a80a752@ti.com>
Message-ID: <7c2b1ce2-7d92-be80-2007-e6bb8d7e8bb6@ti.com>
Date: Fri, 4 Oct 2019 15:29:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <85cae64f-4bad-de7f-1a73-9c074a80a752@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master PATCH v1] recipes-tisdk: makefile: Move matrix-gui out of common targets
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
X-List-Received-Date: Fri, 04 Oct 2019 10:00:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 03/10/19 7:07 PM, Nikhil Devshatwar wrote:
> On 01/10/19 8:36 PM, Jacob Stiffler wrote:
>> NAK
> The reason I posted this patch was to avoid the matrix-gui package in the installer.
> Without this, make all fails because I am not including matrix-gui src ipk in the installer bundle.

Is there any way to avoid packaging the matrix-gui but not fail with make all from installer?

>
> Nikhil D
>>
>>
>> This "matrix-gui" is the html files which provide the gui. They are use on all platforms. Graphics is not needed as you can remotely view matrix from a remote browser.
>>
>> It is the "matrix-gui-browser" which provides to platform QT application.
>>
>>
>> On 10/1/2019 8:44 AM, Nikhil Devshatwar wrote:
>>> Many machines do not support matrix-gui. Remove the Makefile target
>>> matrix-gui from the list of common targets.
>>>
>>> This will ensure that the make all / make install on other machine SDKs
>>> will not cause failures.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>> .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>>> index 28b616d..e99821e 100644
>>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
>>> @@ -57,7 +57,8 @@ SRC_URI = "\
>>>     PR = "r102"
>>>   -MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
>>> +MAKEFILES_MATRIX_GUI = "matrix-gui \
>>> +                        matrix-gui-browser \
>>>                           refresh-screen \
>>>                           qt-tstat \
>>>   "
>>> @@ -67,7 +68,6 @@ MAKEFILES_MATRIX_GUI_omapl138 = ""
>>>   MAKEFILES_MATRIX_GUI_j7-evm = ""
>>>     MAKEFILES_COMMON = "linux \
>>> -                    matrix-gui \
>>>                       arm-benchmarks \
>>>                       am-sysinfo \
>>>                       oprofile-example \
>


