Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D03EF529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 13:54:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85DsxHL002849
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 08:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504619699;
	bh=o1gLuGAtNunRVNPZHi5XmZaHGToac6GBfI/fbBGAE/k=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=wSY7z99nyimNYjfmlGkcXN/C/zC4rPKTF4bt6g8X6yBPaM67s1uhkDGQzoQhezv9s
	x23vvNxOdNCOHSZsEKTeI1cvmaN3mReLpxpq9ifbQN3Haeks8tYTxQpKSDo/E6iyLo
	b+VGIAPj9z1gmQrrAYNYq72OKbot6urkZGs85TPk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85DsxFp009969
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 08:54:59 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 08:54:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 08:54:59 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85DswRU025361;
	Tue, 5 Sep 2017 08:54:59 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
	<20170901211741.26451-3-manisha.agrawal@ti.com>
	<6dd39526-db2f-598b-770e-00346d66366b@ti.com>
Message-ID: <f154b28e-3c52-115f-5164-d45f563b8183@ti.com>
Date: Tue, 5 Sep 2017 09:54:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <6dd39526-db2f-598b-770e-00346d66366b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v3 3/7] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Tue, 05 Sep 2017 13:55:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

It appears that you also need to provide an updated SRCREV for this to 
build once the file is named correctly.


On 9/5/2017 9:53 AM, Jacob Stiffler wrote:
> The name of this file needs to match the name of the upstream recipe 
> (i.e. matrix-gui-submenus_2.0.bbappend).
>
>
> On 9/1/2017 5:17 PM, Manisha Agrawal wrote:
>> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
>> ---
>>   recipes-core/matrix/matrix-gui-submenus.bbappend | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>   create mode 100644 recipes-core/matrix/matrix-gui-submenus.bbappend
>>
>> diff --git a/recipes-core/matrix/matrix-gui-submenus.bbappend 
>> b/recipes-core/matrix/matrix-gui-submenus.bbappend
>> new file mode 100644
>> index 0000000..681f22e
>> --- /dev/null
>> +++ b/recipes-core/matrix/matrix-gui-submenus.bbappend
>> @@ -0,0 +1,11 @@
>> +PR_append = ".tisdk2"
>> +
>> +SUBMENUS_append = " \
>> +    hmi_submenu \
>> +"
>> +
>> +PACKAGES_append = " \
>> +    ${PN}-hmi \
>> +"
>> +
>> +FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
> s


