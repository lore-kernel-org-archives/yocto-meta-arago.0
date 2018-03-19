Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A8DD452998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:18:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIHKMZ030224
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521483440;
	bh=je5iSBTA62b9vV+JvrQZfT2+fTTstqgbSU6dM3eHq+0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=EblwNOLN8nYWA31EsrURvDM63XwHxtgpL+U8oU+gbs85ADiK9PyJu3mGafKYLT0EO
	3IdFqlzP+oCsECeQ0vgHFvTegWRrorJxJQ4EbjMSiaS62JnfZFPX79IynnIAt0XkxY
	XBCRIF7Z3nD4z4GhsW5Hw5q203/wvMgALqLYgpWM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIHKAU017041
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:17:20 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:17:19 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Mon, 19 Mar 2018 13:17:19 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][PATCH] posix-smp-demo: Updating
	to version 01.01.00.00
Thread-Index: AQHTv65bk91docoMdUKrbJ6nAN3uXaPX3ZPw
Date: Mon, 19 Mar 2018 18:17:19 +0000
Message-ID: <e081c2196b374e06acf7afc676e495a2@ti.com>
References: <1521483111-25020-1-git-send-email-m-radhakrishnan2@ti.com>
	<a039050c-1037-cc8d-dccd-16f018352f7b@ti.com>
In-Reply-To: <a039050c-1037-cc8d-dccd-16f018352f7b@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.180]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][PATCH] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Mon, 19 Mar 2018 18:18:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8uIEkgd2lsbCBzdWJtaXQgdGhlIHBhdGNoIG5vdy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFN0aWZmbGVyLCBKYWNvYiANClNlbnQ6IE1vbmRheSwgTWFyY2ggMTksIDIw
MTggMjoxNiBQTQ0KVG86IFJhZGhha3Jpc2huYW4sIE1haGVzaDsgbWV0YS1hcmFnb0BhcmFnby1w
cm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFtFWFRFUk5BTF0gW21ldGEtYXJhZ29dIFttb3J0eV1b
UEFUQ0hdIHBvc2l4LXNtcC1kZW1vOiBVcGRhdGluZyB0byB2ZXJzaW9uIDAxLjAxLjAwLjAwDQoN
CkFueSByZWFzb24gdGhpcyBzaG91bGQgbm90IGFsc28gZ28gdG8gcm9ja28vbWFzdGVyPw0KDQoN
Ck9uIDMvMTkvMjAxOCAyOjExIFBNLCBNYWhlc2ggUmFkaGFrcmlzaG5hbiB3cm90ZToNCj4gU2ln
bmVkLW9mZi1ieTogTWFoZXNoIFJhZGhha3Jpc2huYW4gPG0tcmFkaGFrcmlzaG5hbjJAdGkuY29t
Pg0KPiAtLS0NCj4gICBtZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRl
bW8vcG9zaXgtc21wLWRlbW8uaW5jIHwgNiArKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hcmFn
by1leHRyYXMvcmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLmluYyBi
L21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtYXBwcy9wb3NpeC1zbXAtZGVtby9wb3NpeC1zbXAt
ZGVtby5pbmMNCj4gaW5kZXggYjBhYmQyYi4uM2Q3ODcyNyAxMDA2NDQNCj4gLS0tIGEvbWV0YS1h
cmFnby1leHRyYXMvcmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLmlu
Yw0KPiArKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8v
cG9zaXgtc21wLWRlbW8uaW5jDQo+IEBAIC03LDE0ICs3LDE0IEBAIFBPU0lYX1NNUF9HSVRfVVJJ
ID0gImdpdDovL2dpdC50aS5jb20va2V5c3RvbmUtZGVtb3MvcG9zaXgtc21wLmdpdCINCj4gICBQ
T1NJWF9TTVBfR0lUX1BST1RPQ09MID0gImdpdCINCj4gICBQT1NJWF9TTVBfR0lUX0JSQU5DSCA9
ICJtYXN0ZXIiDQo+ICAgDQo+IC0jIEJlbG93IGNvbW1pdCBJRCBjb3JyZXNwb25kcyB0byAiREVW
LlBPU0lYLVNNUC4wMS4wMC4wMS4wNyINCj4gLVBPU0lYX1NNUF9TUkNSRVYgPSAiMjYxNGQ0Y2Jl
OWQ4M2M4MzQ1ZTA1MWM3ZjM3NjdmODYyMjYzOThlYSINCj4gKyMgQmVsb3cgY29tbWl0IElEIGNv
cnJlc3BvbmRzIHRvICJERVYuUE9TSVgtU01QLjAxLjAxLjAwLjAwIg0KPiArUE9TSVhfU01QX1NS
Q1JFViA9ICIxMzlmZTdlYzU4OTM5ZGMyNzQzMzU1ZTVmZWRlMDczNWY4NjkzZWJkIg0KPiAgIA0K
PiAgIEJSQU5DSCA9ICIke1BPU0lYX1NNUF9HSVRfQlJBTkNIfSINCj4gICBTUkNfVVJJID0gIiR7
UE9TSVhfU01QX0dJVF9VUkl9O3Byb3RvY29sPSR7UE9TSVhfU01QX0dJVF9QUk9UT0NPTH07YnJh
bmNoPSR7QlJBTkNIfSINCj4gICANCj4gICBTUkNSRVYgPSAiJHtQT1NJWF9TTVBfU1JDUkVWfSIN
Cj4gLVBWID0gIjAxLjAwLjAxLjA3Ig0KPiArUFYgPSAiMDEuMDEuMDAuMDAiDQo+ICAgSU5DX1BS
ID0gInIwIg0KPiAgIA0KPiAgIFMgPSAiJHtXT1JLRElSfS9naXQiDQoNCg==

