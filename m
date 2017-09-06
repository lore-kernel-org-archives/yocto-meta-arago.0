Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B4F245297F
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 16:47:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86Glmca031300
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 11:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504716468;
	bh=/rHbr40+q2Xw9FtXh+0WkP3fC+VS28Y6yQXNIo3Yixg=;
	h=Subject:From:To:References:CC:Date:In-Reply-To;
	b=Mt+cWvwzJ2HUFTpoRxBGp3MiAJSLG3H9lt6asFgW9r3ZZ42kY9mKeShmpeQ+dfZ6W
	cHjEF2+VzoarzjDZuB2EDp50eQXvVDZEivqRhW8ggj6B7bFaj0ZXSsxJd5KlBavguQ
	yi5LDArc/ULREwT7k/OEVJhwQer8lR7kAAZuEAJ8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Glhr1010700
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 11:47:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 11:47:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 11:47:43 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Glf67026768;
	Wed, 6 Sep 2017 11:47:42 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170905174356.14207-1-manisha.agrawal@ti.com>
	<e6c476e1-03aa-6fad-f5c3-6c1ab870c36e@ti.com>
Message-ID: <9c892470-9b33-63e6-885f-036b0b6f7f19@ti.com>
Date: Wed, 6 Sep 2017 12:47:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <e6c476e1-03aa-6fad-f5c3-6c1ab870c36e@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v1] ti-tisdk-makefile : Add evse-hmi and protection-relays-hmi Makefile
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
X-List-Received-Date: Wed, 06 Sep 2017 16:47:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Will you be providing an update?


On 9/5/2017 1:46 PM, Jacob Stiffler wrote:
> This fails to build. Please test your patches before submitting.
>
>
> On 9/5/2017 1:43 PM, Manisha Agrawal wrote:
>> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
>> ---
>>   .../ti-tisdk-makefile/Makefile_evse-hmi            | 24 
>> ++++++++++++++++++++++
>>   .../Makefile_protection-relays-hmi                 | 24 
>> ++++++++++++++++++++++
>>   .../ti-tisdk-makefile_1.0.bbappend                 |  9 +++++++-
>>   3 files changed, 56 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi
>>   create mode 100644 
>> recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi
>>
>> diff --git 
>> a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi 
>> b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi
>> new file mode 100644
>> index 0000000..b19e630
>> --- /dev/null
>> +++ 
>> b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi
>> @@ -0,0 +1,24 @@
>> +# Evse HMI build targets
>> +evse-hmi:
>> +    @echo ================================
>> +    @echo    Building Evse HMI Demo
>> +    @echo ================================
>> +    @cd example-applications; cd `find . -name "*evse-hmi*"`; make 
>> -f Makefile.build
>> +
>> +evse-hmi_clean:
>> +    @echo ================================
>> +    @echo    Building Evse HMI Demo
>> +    @echo ================================
>> +    @cd example-applications; cd `find . -name "*evse-hmi*"`; make 
>> -f Makefile.build clean
>> +
>> +evse-hmi_install:
>> +    @echo ===================================================
>> +    @echo   Installing Evse HMI Demo - Release version
>> +    @echo ===================================================
>> +    @cd example-applications; cd `find . -name "*evse-hmi*"`; make 
>> -f Makefile.build install
>> +
>> +evse-hmi_install_debug:
>> +    @echo =================================================
>> +    @echo   Installing Evse HMI Demo - Debug version
>> +    @echo =================================================
>> +    @cd example-applications; cd `find . -name "*evse-hmi*"`; make 
>> -f Makefile.build install_debug
>> diff --git 
>> a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi 
>> b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi 
>>
>> new file mode 100644
>> index 0000000..04f434f
>> --- /dev/null
>> +++ 
>> b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi
>> @@ -0,0 +1,24 @@
>> +#Protection Relays HMI build targets
>> +protection-relays-hmi:
>> +    @echo ================================
>> +    @echo    Building Protection Relays HMI Demo
>> +    @echo ================================
>> +    @cd example-applications; cd `find . -name 
>> "*protection-relays-hmi*"`; make -f Makefile.build
>> +
>> +protection-relays-hmi_clean:
>> +    @echo ================================
>> +    @echo    Building Protection Relays HMI Demo
>> +    @echo ================================
>> +    @cd example-applications; cd `find . -name 
>> "*protection-relays-hmi*"`; make -f Makefile.build clean
>> +
>> +protection-relays-hmi_install:
>> +    @echo ===================================================
>> +    @echo   Installing Protection Relays HMI Demo - Release version
>> +    @echo ===================================================
>> +    @cd example-applications; cd `find . -name 
>> "*protection-relays-hmi*"`; make -f Makefile.build install
>> +
>> +protection-relays-hmi_install_debug:
>> +    @echo =================================================
>> +    @echo   Installing Protection Relays HMI Demo - Debug version
>> +    @echo =================================================
>> +    @cd example-applications; cd `find . -name 
>> "*protection-relays-hmi*"`; make -f Makefile.build install_debug
>> diff --git 
>> a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend 
>> b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
>> index 68d11c6..bd12f12 100644
>> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
>> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
>> @@ -22,6 +22,7 @@ MAKEFILES_append_omap-a15 = " dual-camera-demo \
>>                                 image-gallery \
>>                                 ti-ipc \
>>                                 big-data-ipc-demo \
>> +                  evse-hmi \
>>   "
>>     MAKEFILES_append_omapl138 = " ti-ipc \
>> @@ -33,7 +34,13 @@ MAKEFILES_remove_omapl138 = "u-boot-legacy"
>>     MAKEFILES_append_omap-a15 = " video-graphics-test"
>>   -MAKEFILES_append_ti43x = " cmem-mod"
>> +MAKEFILES_append_ti43x = " cmem-mod \
>> +               evse-hmi \
>> +"
>> +
>> +MAKEFILES_append_ti33x = " evse-hmi \
>> +               protection-relays-hmi \
>> +"
>>     MAKEFILES_append_am57xx-evm = " jailhouse"
>


