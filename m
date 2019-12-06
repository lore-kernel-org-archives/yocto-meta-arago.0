Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by arago-project.org (Postfix) with ESMTPS id 89E65529B5
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 20:30:51 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id x3so6882993oto.11
	for <meta-arago@arago-project.org>;
	Fri, 06 Dec 2019 12:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:subject:date:message-id
	:references:cc:in-reply-to:to;
	bh=+w8zrCAiPOTOootX/3h36Anv7YF3BkqR4e9C3wDxUFQ=;
	b=ijPv38iJ4P9wE3O5cEGYk9DPTb7o5sLJyYqseY9TTvGLXLASk7vqu9EPbSDOz/fylM
	qghH0Rzhbjxx2NjJ8xdVSnJlQj8sz1PLpO0zQw3G8dPzHdjtHx02ixLTMaWmhGs0p/wb
	paZAa+dP1JC7LbcQWDK5d8FY0EuqzCuIojca5r+yAWK61AowuX1bw+Kd1ZpUZSdSKMi7
	I7ymsaDuLQ3wAS2m4y6vB1F2NiGpB5OX2NMe0/RjX2+ztlPq7U2LlkYO2va1AaTMAnqt
	8iC21MbjedFsUUzjYyJgvIIk0l7m2wA5UGwSSg05+F7dqCGkbVm0y2zaahmlCN6TQZiU
	NyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=+w8zrCAiPOTOootX/3h36Anv7YF3BkqR4e9C3wDxUFQ=;
	b=p0ukyrcFVNq/vlnuwVemgET9eIEx8dzh/W38V3WCigSBsoMmMjW3AGvoPnp5LfvGxc
	ppqu2lzXQVfVYwu1jBIGHm7rrJ6zq1u6wUFYX0d5na+UwqPSgtSOfmTp+S6UOElS/QtT
	p6N6ONWRq8JclgsLjM86HxQD4QTKE0aJpTZbp6ZAEVqtA9AhAiElM/eprsxVD9AKNX2V
	NrcrRQK/KPFr7DTONlaOW3guwci023lFnLyWnsyIFiSAv5NNqv4gAEiAB0YqETt66/Wg
	VAxzo35Ek3DQzhrsUrafSLmQbLe5b2iZ8dwcjk/u7ifnzQPeeiYenUeutCpK3FncHCvp
	62jw==
X-Gm-Message-State: APjAAAVZs3cqGQSzudJUr+jtA6bJfAkv9sH5tNdsPeGKfCTzSpDEyLVD
	aJ8bvk/04R5QdbGGdu789Ec=
X-Google-Smtp-Source: APXvYqzKH8b2I0V+qsfZG4VaVkhEfZV9yYZw9rw5VyTHwCAuae2bh/LTaO0PM0w1qrQH8SrmamokuQ==
X-Received: by 2002:a9d:798e:: with SMTP id h14mr12255621otm.257.1575664158535;
	Fri, 06 Dec 2019 12:29:18 -0800 (PST)
Received: from [192.168.2.22] (cpe-76-184-237-208.tx.res.rr.com.
	[76.184.237.208]) by smtp.gmail.com with ESMTPSA id
	j43sm5011542ota.59.2019.12.06.12.29.17
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Dec 2019 12:29:17 -0800 (PST)
From: hari n <hnagalla@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 6 Dec 2019 14:29:09 -0600
Message-Id: <6C895589-06CD-44D1-8FA4-3A9500934474@gmail.com>
References: <20191206201935.GX24609@beryl>
In-Reply-To: <20191206201935.GX24609@beryl>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: iPhone Mail (17A878)
Cc: meta-arago@arago-project.org
Subject: Re: [ 1/1] Use wireless-regdb-static for K4.15 and later
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
X-List-Received-Date: Fri, 06 Dec 2019 20:30:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Denys,

It is not needed. We do not need uim, as we moved away from shared transport=
.=20

In v1, I used the tisdk6.1 snapshot repository. This time, I pulled using th=
e thud configuration.=20

Thanks
Hari


> On Dec 6, 2019, at 2:19 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>=20
> =EF=BB=BFSo, is "uim" still needed or not? In v1 you tried to remove it, b=
ut it got=20
> renamed to "uim-sysfs" to avoid confusion with other uim package. I'm just=
=20
> trying to see if we still need it or can simply drop the recipe from meta-=
ti.
>=20
> Denys
>=20
>=20
>> On Fri, Dec 06, 2019 at 02:16:38PM -0600, Hari Nagalla wrote:
>> ---
>> .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-tisdk-connectivity.bb
>> index 72b72d6c..a44c4063 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
>> @@ -8,13 +8,13 @@ inherit packagegroup
>>=20
>> # WLAN support packages.
>> # These are the packages that all platforms use for WLAN support
>> -# add wireless-regdb
>> +# add wireless-regdb-static
>> WLAN_COMMON =3D "\
>>     iw \
>>     softap-udhcpd-config \
>>     eventdump \
>>     wlconf \
>> -    wireless-regdb \
>> +    wireless-regdb-static \
>>     linux-firmware-iwlwifi-8000c \
>>     linux-firmware-iwlwifi-8265 \
>>     linux-firmware-iwlwifi-3160-17 \
>> --=20
>> 2.17.1
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

