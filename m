Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id EBF7D529C8
	for <meta-arago@arago-project.org>;
	Fri, 26 Mar 2021 21:53:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12QLrp84102316;
	Fri, 26 Mar 2021 16:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616795631;
	bh=UYNtzWFiHRuKN2/AmQTSHbZmUhlUBzHjfpKDwhnIO6E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=tkyQ26Ud5MuRKhpcPX3H9wbFMfbPvo7aIU/EWxr5aUj1O5f7FWY0oOQgVtH9oNh80
	9Nm59PzQhGO/KziN50spZ+Yo0lTwVykqJuDtdQFKFwWkrpYv3ARZw/ul31PJmlkeGG
	IgIe0RD4OFbS9YHpfoOi0ZL4x6Gfgz5Qf+Hkbrpk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12QLrpq6027719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Mar 2021 16:53:51 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 26 Mar 2021 16:53:51 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Fri, 26 Mar 2021 16:53:51 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [dunfell/master][PATCH] arago.conf:
	enable examples pkg for qtdeclarative
Thread-Index: AQHXIZFNV1zH7YQ5FEe7FBIP8v4YXKqW0OiQ
Date: Fri, 26 Mar 2021 21:53:51 +0000
Message-ID: <08243e9838cb438b849106ce40b75722@ti.com>
References: <20210324191522.23836-1-g-tammana@ti.com>
	<20210325160953.GR18041@denix.org>
In-Reply-To: <20210325160953.GR18041@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.73.35]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [EXTERNAL] Re: [dunfell/master][PATCH] arago.conf: enable examples pkg for qtdeclarative
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
X-List-Received-Date: Fri, 26 Mar 2021 21:53:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Thursday, March 25, 2021 11:10 AM
>To: Tammana, Gowtham <g-tammana@ti.com>
>Cc: meta-arago@arago-project.org; denys@konsulko.com; Bajjuri, Praneeth
><praneeth@ti.com>
>Subject: [EXTERNAL] Re: [meta-arago] [dunfell/master][PATCH] arago.conf:
>enable examples pkg for qtdeclarative
>
>On Wed, Mar 24, 2021 at 02:15:22PM -0500, Gowtham Tammana wrote:
>> qtdeclarative-examples package was disabled due to build issues.
>> Reenable it as there are no build issues now.
>
>Does it work for you? It still seems to break for me.
>I guess Praneeth can throw it on the build farm to try...

My build went through post this and did see examples opkg getting generated=
.
Will trigger another build, and ofcourse can wait to hear from Praneeth's
build-farm run.

Thanks,
Gowtham

>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  meta-arago-distro/conf/distro/arago.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
>distro/conf/distro/arago.conf
>> index 7c702814..3c715447 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -125,7 +125,7 @@ PACKAGECONFIG_append_pn-qtmultimedia =3D " gstreamer=
"
>>
>>  # Add examples in Qt5 package configurations
>>  PACKAGECONFIG_append_pn-qtcharts =3D " examples"
>> -#PACKAGECONFIG_append_pn-qtdeclarative =3D " examples"
>> +PACKAGECONFIG_append_pn-qtdeclarative =3D " examples"
>>  PACKAGECONFIG_append_pn-qtlocation =3D " examples"
>>  PACKAGECONFIG_append_pn-qtmultimedia =3D " examples"
>>  PACKAGECONFIG_append_pn-qtscript =3D " examples"
>> --
>> 2.31.0

