Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 13A2352A70
	for <meta-arago@arago-project.org>;
	Wed, 10 Mar 2021 18:49:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AIo6Np060951
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 12:50:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615402206;
	bh=bSZkmBBd90LcZKogEJh1OCATvLe6rkktNyDnapWM5Ec=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=iq2xpSm3PzKXIxKFlLw2XfNx+j/wg26EWSQRwI3/XKjebI8Zs9XSEhpD4mjlT3XjR
	YpGjYtQmi0z0e3lAA/XGe5YrglC/BiXh6YYCm4XguULuhaTgMeOD8Pgolm7aK2Ecsn
	/+KNPtJveQTYKXQbW//ekRFisru/OCeokgV+emBg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AIo6gF069425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 12:50:06 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 10 Mar 2021 12:50:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 10 Mar 2021 12:50:05 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AIo5YC025226;
	Wed, 10 Mar 2021 12:50:05 -0600
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <20210303182136.31765-1-nikhil.nd@ti.com>
	<8d2e4f84-1c71-bbf7-8d04-7ccb9725db71@ti.com>
	<ad817c2c-258c-09e3-57f4-6a30b1862da1@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <01c2ef99-7972-77f0-04a0-184dfe30b0bc@ti.com>
Date: Wed, 10 Mar 2021 12:50:05 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ad817c2c-258c-09e3-57f4-6a30b1862da1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com, saurabhnarang@ti.com, hnagalla@ti.com, nsekhar@ti.com,
	kishon@ti.com
Subject: Re: [meta-ti][dunfell/master][PATCH v2] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Wed, 10 Mar 2021 18:49:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/10/2021 12:37 PM, Nikhil Devshatwar wrote:
> 
> 
> On 10/03/21 11:00 pm, Bajjuri, Praneeth wrote:
>>
>>
>> On 3/3/2021 12:21 PM, Nikhil Devshatwar wrote:
>>> Currently, the K3 platforms do not include the TI wlan related packages.
>>> Add in the tisdk-connectivity packagegroup.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Suggested-by: Hari Nagalla <hnagalla@gmail.com>
>>> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>>
>>> Notes:
>>>      changes from v1:
>>
>> s/meta-ti/meta-arago. Please point to right project next time.
> Sorry about that. Reused last command and missed this.
> 
>>
>>>      * Drop the new recipe and simply include the existing packages 
>>> for wilink
>>>        This way, all the platforms are using the same recipes and we 
>>> don't
>>>        have to maintain any new recipe just for the am64xx-sk
>>>        The firmare will get picked from the repo
>>>        git://git.ti.com/wilink8-wlan/wl18xx_fw.git
>>>
>>>   .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git 
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb 
>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb 
>>>
>>> index 11109432..ab632924 100644
>>> --- 
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb 
>>>
>>> +++ 
>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb 
>>>
>>> @@ -89,6 +89,7 @@ CONNECTIVITY_RDEPENDS_append_dra7xx = "\
>>>   CONNECTIVITY_RDEPENDS_append_k3 = "\
>>>       ${WLAN_COMMON} \
>>>       ${BT_COMMON} \
>>> +    ${WLAN_TI} \
>>>   "
>>
>> Looks like WLAN_TI and WLAN_COMMON is valid for all platforms defined 
>> in this packagegroup.
>>
>> why not move both of them under CONNECTIVITY_RDEPENDS without a 
>> specific platform append?.
> 
> Looking at the history, the following commit split the package list into 
> a separate group explicitly:
> 
> d24fa63f33 ("packagegroup-*-connectivity: restructure WLAN & BT lists 
> and add WLAN to K3")
> 
> Where the WLAN_COMMON was added but WLAN_TI was not added.

Thats correct, But after this patch we have WLAN_TI and WLAN_COMMON for 
all platforms now (including K3).

Why not do something like this.

@@ -61,36 +61,25 @@ CONNECTIVITY_RDEPENDS = " \
      iproute2-devlink \
      net-snmp \
      net-snmp-server-snmpd \
-"
-
-CONNECTIVITY_RDEPENDS_append_ti33x = "\
      ${WLAN_COMMON} \
      ${WLAN_TI} \
      ${BT_COMMON} \
+"
+
+CONNECTIVITY_RDEPENDS_append_ti33x = "\
      ${BT_TI} \
      ${DEMO_APPS} \
  "

  CONNECTIVITY_RDEPENDS_append_ti43x = "\
-    ${WLAN_COMMON} \
-    ${WLAN_TI} \
-    ${BT_COMMON} \
      ${BT_TI} \
      ${DEMO_APPS} \
  "

  CONNECTIVITY_RDEPENDS_append_dra7xx = "\
-    ${WLAN_COMMON} \
-    ${WLAN_TI} \
-    ${BT_COMMON} \
      ${BT_TI} \
  "

-CONNECTIVITY_RDEPENDS_append_k3 = "\
-    ${WLAN_COMMON} \
-    ${BT_COMMON} \
-"
-



> 
> Regards,
> Nikhil D
>>
>>>   RDEPENDS_${PN} = "\
>>>

