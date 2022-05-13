Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0306CC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:57:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.5657.1652428649264365068
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oPOqyhwQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7vQHr031033;
	Fri, 13 May 2022 02:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428646;
	bh=8KY7/z6NIIbA1sEAprGffSOaOnBVjqRMCqkW1LbT9gI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=oPOqyhwQLe7fTwGBWy4/cs6DeD+O+UzWl/XFCo1Qizea3tQ8kTy7rdwBdH2dYUcKF
	 dz6Mk81nrqf3vPRxXMPx/e3QBQzaZ+6fKEKNTnBsSZaNn41vS29BR0yj2+2PUeToSP
	 JfKCkG5Q4Lbs4H8zNBjntuTpEIlK9PnGmDfBvbOU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7vQRT112752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:57:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:57:26 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2308.014; Fri, 13 May 2022 02:57:26 -0500
From: "M, Aparna" <a-m1@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>, "M, Aparna" <a-m1@ti.com>,
        "meta-arago@lists.yoctoproject.org"
 <meta-arago@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "denis@denix.org" <denis@denix.org>, "Menon, Nishanth" <nm@ti.com>
CC: "Thakkar, Devarsh" <devarsht@ti.com>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add
 ti-sci-firmware binary to prebuilt-images directory of SDK
Thread-Topic: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add
 ti-sci-firmware binary to prebuilt-images directory of SDK
Thread-Index: AQHYZhXppqJDPRH0C0W6vJllxWJv/q0dIU6A
Date: Fri, 13 May 2022 07:57:26 +0000
Message-ID: <eb5fe2f387a34ed291b0f862ca078f6f@ti.com>
References: <20220512152846.661-1-a-m1@ti.com>
 <a77eefeb-df53-ee0f-4bbf-89b2c353db36@ti.com>
In-Reply-To: <a77eefeb-df53-ee0f-4bbf-89b2c353db36@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: DFLE111.ent.ti.com (15.01.2308.014)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.250.233.187]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3D458CE68E28647B0122C80F82750AD@owa.mail.ti.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13861

DQpPbiAxMi8wNS8yMiAyMTowNSwgUnlhbiBFYXRtb24gd3JvdGU6DQo+DQo+DQo+IE9uIDUvMTIv
MjAyMiAxMDoyOCwgQXBhcm5hIE0gd3JvdGU6DQo+PiBBZGQgdGktc2NpLWZpcm13YXJlIGJpbmFy
aWVzIHJlcXVpcmVkIGZvciB1Ym9vdCBidWlsZCB0byB0aGUNCj4+IHByZWJ1aWx0LWltYWdlcyBk
aXJlY3Rvcnkgb2YgU0RLLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFwYXJuYSBNIDxhLW0xQHRp
LmNvbT4NCj4+IC0tLQ0KPj4gwqAgbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2ltYWdl
cy90aXNkay1jb3JlLWJ1bmRsZS5iYiB8IDMgKysrDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gVGhpcyBwYXRjaCBpcyBkZXBlbmRlbnQgb24NCj4+IGh0dHBz
Oi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvdG9waWMvZHVuZmVsbF9wYXRjaF90
aV9zY2lfZncvOTEwNTgyNzkgDQo+Pg0KDQpBcyBwZXIgc3VnZ2VzdGlvbnMgb24gcHJldmlvdXMg
cGF0Y2gsIHRoaXMgaXMgdGhlIG5ldyBwYXRjaCBkZXBlbmRlbmN5Og0KaHR0cHM6Ly9saXN0cy55
b2N0b3Byb2plY3Qub3JnL2cvbWV0YS10aS90b3BpYy9kdW5mZWxsX3BhdGNoLzkxMDc2MTMzDQoN
Cj4+DQo+PiBkaWZmIC0tZ2l0IA0KPj4gYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUv
aW1hZ2VzL3Rpc2RrLWNvcmUtYnVuZGxlLmJiIA0KPj4gYi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNp
cGVzLWNvcmUvaW1hZ2VzL3Rpc2RrLWNvcmUtYnVuZGxlLmJiDQo+PiBpbmRleCA5ZWJjYmIwZS4u
ZDVhMTFmMzYgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUv
aW1hZ2VzL3Rpc2RrLWNvcmUtYnVuZGxlLmJiDQo+PiArKysgYi9tZXRhLWFyYWdvLWRpc3Ryby9y
ZWNpcGVzLWNvcmUvaW1hZ2VzL3Rpc2RrLWNvcmUtYnVuZGxlLmJiDQo+PiBAQCAtMjEsNiArMjEs
OSBAQCBERVBMT1lfSU1BR0VTX05BTUVfYXBwZW5kX2o3LWV2bSA9ICIgc3lzZncuaXRiIg0KPj4g
wqAgREVQTE9ZX0lNQUdFU19OQU1FX2FwcGVuZF9qNy1ocy1ldm0gPSAiIHN5c2Z3Lml0YiINCj4+
IMKgIERFUExPWV9JTUFHRVNfTkFNRV9hcHBlbmRfYW02NXh4LWV2bSA9ICIgDQo+PiB0aS1zY2kt
ZmlybXdhcmUtYW02NXgtZ3AuYmluIHN5c2Z3LWFtNjV4LWV2bS5pdGIgDQo+PiBzeXNmdy1hbTY1
eF9zcjItZXZtLml0YiINCj4+IMKgIERFUExPWV9JTUFHRVNfTkFNRV9hcHBlbmRfajctZXZtID0g
IiB0aS1mcy1maXJtd2FyZS1qNzIxZS1ncC5iaW4iDQo+PiArREVQTE9ZX0lNQUdFU19OQU1FX2Fw
cGVuZF9hbTY0eHgtZXZtID0gIiB0aS1zY2ktZmlybXdhcmUtYW02NHgtZ3AuYmluIg0KPj4gK0RF
UExPWV9JTUFHRVNfTkFNRV9hcHBlbmRfYW02NHh4LWhzLWV2bSA9ICIgDQo+PiB0aS1zY2ktZmly
bXdhcmUtYW02NHgtaHMtY2VydC5iaW4gdGktc2NpLWZpcm13YXJlLWFtNjR4LWhzLWVuYy5iaW4g
DQo+PiBmaXRJbWFnZS1pdHMuaXRzIg0KPj4gK0RFUExPWV9JTUFHRVNfTkFNRV9hcHBlbmRfYW02
Mnh4LWV2bSA9ICIgdGktZnMtZmlybXdhcmUtYW02MngtZ3AuYmluIA0KPj4gaXBjX2VjaG9fdGVz
dGJfbWN1MV8wX3JlbGVhc2Vfc3RyaXAueGVyNWYiDQo+PiDCoCDCoCBBUkFHT19USVNES19JTUFH
RSA/PSAidGlzZGstY29yZS1idW5kbGUiDQo+PiDCoCBleHBvcnQgSU1BR0VfQkFTRU5BTUUgPSAi
JHtBUkFHT19USVNES19JTUFHRX0iDQo+DQo+DQo+IFNhbWUgYXMgdGhlIG90aGVyIHBhdGNoIG9u
IG1ldGEtdGkuwqAgSSB0aGluayB0aGUgDQo+IGlwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNl
X3N0cmlwLnhlcjVmIGZpbGUgbmVlZHMgdG8gbm90IGJlIGluIHRoaXMgDQo+IGZpbGUuwqAgVGhl
IG90aGVyIGNoYW5nZXMgYXJlIGZpbmUsIGJ1dCByZW1vdmUgdGhhdCBvbmUuDQoNClRoZSBpcGNf
ZWNob190ZXN0Yl9tY3UxXzBfcmVsZWFzZV9zdHJpcC54ZXI1ZiBmaWxlIGlzIHJlcXVpcmVkIGlu
IHRoZSANClNESyBmb3IgdG9wbGV2ZWwgbWFrZWZpbGUgdWJvb3QgYnVpbGQgZm9yIGFtNjJ4eC1l
dm0uIFNvIGl0IG5lZWRzIHRvIGJlIA0KcGFja2FnZWQgaW4gdGhlIHByZWJ1aWx0LWltYWdlcyBm
b2xkZXIgb2YgdGhlIFNESy4NCg0KLS0gDQpBcGFybmENCg0K

