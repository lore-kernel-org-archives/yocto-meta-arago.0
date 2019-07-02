Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DE613520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 13:10:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62D9Zhj007661
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 08:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562072975;
	bh=bHgIUdUs6aCegKbuNTkHTA5vDzTg3qOBuc18MuV1+mQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=n6a6zD33A30Hb3KDDhtO9cu/ogpc50FZim3owNk5tmEZyVbDWshCpG8cjhg+FbYrX
	J8O/7u0+QKh7cuVqp6YXxqa4DYvpk3tMXuqM1Tz51rk9/FYDz9eGixf7ugw5R5P7Ha
	W5Ueukfnyr9Ko7TEjmQKt/+3K08C2ZrD97BH9KR8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62D9ZAQ101247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 08:09:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 08:09:34 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Tue, 2 Jul 2019 08:09:34 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provider
	for J7
Thread-Index: AQHVLjR2YJRbOYoWDUeDdcD015LUpKa2gjsAgAEgeYD//6+PsA==
Date: Tue, 2 Jul 2019 13:09:34 +0000
Message-ID: <66757a6901794ace8df064dbe5c1cbab@ti.com>
References: <20190629043954.7786-1-g-tammana@ti.com>
	<01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
	<2036ba68-d3a2-8000-6e95-51b08bc64669@ti.com>
In-Reply-To: <2036ba68-d3a2-8000-6e95-51b08bc64669@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.82.84]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
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
X-List-Received-Date: Tue, 02 Jul 2019 13:10:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEJhbGFnb3BhbGFrcmlzaG5h
biwgQW5hbmQNCj5TZW50OiBUdWVzZGF5LCBKdWx5IDAyLCAyMDE5IDc6NTcgQU0NCj5UbzogRG15
dHJpeWVua28sIERlbnlzOyBUYW1tYW5hLCBHb3d0aGFtOyBtZXRhLWFyYWdvQGFyYWdvLXByb2pl
Y3Qub3JnDQo+Q2M6IFJ1ZWksIEVyaWMNCj5TdWJqZWN0OiBSZTogW21ldGEtYXJhZ29dW3RodWRd
W1BBVENIIDEvM10gYXJhZ28tcHJlZnM6IFNwZWNpZnkgZ2JtIHByb3ZpZGVyDQo+Zm9yIEo3DQo+
DQo+V2UgbmVlZCB0byBjaGFuZ2Uga21zY3ViZSwgb21hcGRybXRlc3QsIHdlc3RvbiByZWNpcGVz
IHRvIGNoYW5nZSBERVBFTkRTDQo+b24gdmlydHVhbC9saWJnYm0gaW5zdGVhZCBvZiBsaWJnYm0u
IE5vdCBzdXJlIGlmIGl0IGhhcyBiZWVuIHBvc3RlZC4NCg0KaHR0cDovL2FyYWdvLXByb2plY3Qu
b3JnL3BpcGVybWFpbC9tZXRhLWFyYWdvLzIwMTktSnVseS8wMTE2MTMuaHRtbA0KDQpUaGFua3Ms
DQpHb3d0aGFtDQoNCj4NCj5PbiAwMi8wNy8xOSAxOjE0IEFNLCBEbXl0cml5ZW5rbywgRGVueXMg
d3JvdGU6DQo+PiBFUlJPUjogTm90aGluZyBQUk9WSURFUyAnbGliZ2JtJyAoYnV0IC9PRS9hcmFn
by10aHVkLW5leHQtDQo+YnVpbGQvc291cmNlcy9tZXRhLWFyYWdvL21ldGEtYXJhZ28tZXh0cmFz
L3JlY2lwZXMtDQo+Z3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlXzEuMC4wLmJiIERFUEVORFMgb24g
b3Igb3RoZXJ3aXNlIHJlcXVpcmVzIGl0KQ0KPj4gbGliZ2JtIHdhcyBza2lwcGVkOiBQUkVGRVJS
RURfUFJPVklERVJfdmlydHVhbC9saWJnYm0gc2V0IHRvIHRpLWltZy1yb2d1ZS0NCj51bWxpYnMs
IG5vdCBsaWJnYm0NCj4+IE5PVEU6IFJ1bnRpbWUgdGFyZ2V0ICdrbXNjdWJlJyBpcyB1bmJ1aWxk
YWJsZSwgcmVtb3ZpbmcuLi4NCj4+IE1pc3Npbmcgb3IgdW5idWlsZGFibGUgZGVwZW5kZW5jeSBj
aGFpbiB3YXM6IFsna21zY3ViZScsICdsaWJnYm0nXQ0KPj4NCj4+DQo+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBUYW1tYW5hLCBHb3d0aGFtDQo+Pj4gU2VudDogU2F0
dXJkYXksIEp1bmUgMjksIDIwMTkgMTI6NDAgQU0NCj4+PiBUbzogbWV0YS1hcmFnb0BhcmFnby1w
cm9qZWN0Lm9yZzsgRG15dHJpeWVua28sIERlbnlzDQo+Pj4gQ2M6IEJhbGFnb3BhbGFrcmlzaG5h
biwgQW5hbmQ7IFJ1ZWksIEVyaWM7IFRhbW1hbmEsIEdvd3RoYW0NCj4+PiBTdWJqZWN0OiBbbWV0
YS1hcmFnb11bdGh1ZF1bUEFUQ0ggMS8zXSBhcmFnby1wcmVmczogU3BlY2lmeSBnYm0gcHJvdmlk
ZXINCj5mb3INCj4+PiBKNw0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogR293dGhhbSBUYW1tYW5h
IDxnLXRhbW1hbmFAdGkuY29tPg0KPj4+IC0tLQ0KPj4+ICAgbWV0YS1hcmFnby1kaXN0cm8vY29u
Zi9kaXN0cm8vaW5jbHVkZS9hcmFnby1wcmVmcy5pbmMgfCA4ICsrKysrKy0tDQo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL2NvbmYvZGlzdHJvL2luY2x1ZGUvYXJhZ28tcHJl
ZnMuaW5jIGIvbWV0YS0NCj4+PiBhcmFnby1kaXN0cm8vY29uZi9kaXN0cm8vaW5jbHVkZS9hcmFn
by1wcmVmcy5pbmMNCj4+PiBpbmRleCA5Mzk1NjljMC4uMGY5NjEzMjIgMTAwNjQ0DQo+Pj4gLS0t
IGEvbWV0YS1hcmFnby1kaXN0cm8vY29uZi9kaXN0cm8vaW5jbHVkZS9hcmFnby1wcmVmcy5pbmMN
Cj4+PiArKysgYi9tZXRhLWFyYWdvLWRpc3Ryby9jb25mL2Rpc3Ryby9pbmNsdWRlL2FyYWdvLXBy
ZWZzLmluYw0KPj4+IEBAIC0yMyw4ICsyMywxMiBAQCBQUkVGRVJSRURfUFJPVklERVJfdmlydHVh
bC9ncHVkcml2ZXJfajctZXZtID0gInRpLQ0KPj4+IGltZy1yb2d1ZS1kcml2ZXIiDQo+Pj4gICBQ
UkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9saWJnbCA9ICJtZXNhLWdsIg0KPj4+DQo+Pj4gICAj
IEdCTSAoR2VuZXJpYyBCdWZmZXIgTWFuYWdlbWVudCkgcHJlZmVyZW5jZXMNCj4+PiAtUFJFRkVS
UkVEX1BST1ZJREVSX2xpYmdibSA9ICJsaWJnYm0iDQo+Pj4gLVBSRUZFUlJFRF9QUk9WSURFUl9s
aWJnYm0tZGV2ID0gImxpYmdibS1kZXYiDQo+Pj4gK1BSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFs
L2xpYmdibSA9ICJsaWJnYm0iDQo+Pj4gK1BSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2xpYmdi
bS1kZXYgPSAibGliZ2JtLWRldiINCj4+PiArDQo+Pj4gKyMgSjcgZ2JtIHByb3ZpZGVyDQo+Pj4g
K1BSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2xpYmdibV9qNy1ldm0gPSAidGktaW1nLXJvZ3Vl
LXVtbGlicyINCj4+PiArUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvbGliZ2JtLWRldl9qNy1l
dm0gPSAidGktaW1nLXJvZ3VlLXVtbGlicy0NCj4+PiBkZXYiDQo+Pj4NCj4+PiAgICMgVGhpcyBp
cyByZXF1aXJlZCB3aGVuIHVzaW5nIGtleXN0b25lIGRldmljZXMgd2l0aCBncmFwaGljYWwgc3Vw
cG9ydA0KPj4+ICAgIyBzdWNoIGFzIFF0NQ0KPj4+IC0tDQo+Pj4gMi4yMi4wDQo+Pg0KPg0KPg0K
Pi0tDQo+DQo+UmVnYXJkcywNCj5BbmFuZA0K

