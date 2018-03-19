Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 0EC5152998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 20:16:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JKFhsV008824
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521490543;
	bh=Hm1rOrXtyr6Ok2n4yfxkRMqS+QTeoPG0ps6o2ivdQjY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=vEoQ8W64Vz/PRNnsNqwiEdgTUv3/+qEj+2wkW5ty4vrchK8iQkXsBMksNIAUPCTpb
	ELi+1pi9YnIgbtBIonai7Wakw2ddP2DhfXErrsB4zimPb57WQGvMKf6Y428etSMlSS
	cElRdUiyNohw8WQm9t7I981NHtqKKWgniGuZVo1M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKFhvS012791
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 15:15:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 15:15:43 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Mon, 19 Mar 2018 15:15:43 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [meta-processor-sdk 5/6] [PATCH]
	tiovx-app-host: enable compilation of app-host and tutorial example on
	target
Thread-Index: AQHTv7mLNLfo5ykOzk6KypKf6osOIaPX/mHg
Date: Mon, 19 Mar 2018 20:15:42 +0000
Message-ID: <d58563e542b8494b999399233a7a5fe4@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
	<1521484541-8104-6-git-send-email-a0271529@ti.com>
	<6e4d0f9b-5504-bf68-310f-3bbb77ecf38e@ti.com>
	<104812da-96ef-c6f8-ba81-9151053184ed@ti.com>
In-Reply-To: <104812da-96ef-c6f8-ba81-9151053184ed@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.131]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk 5/6] [PATCH] tiovx-app-host: enable compilation of app-host and tutorial example on target
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
X-List-Received-Date: Mon, 19 Mar 2018 20:16:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIEpha2UuICB2MiBwYXRjaCBpcyBub3cgc3VibWl0dGVkIHRvIGFkZCBzZXRlbnYuc2gg
YW5kIHNraXAgZGV2LWRlcHMgZm9yIHRoZSBleGFtcGxlcyBwYWNrYWdlLg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0aWZmbGVyLCBKYWNvYg0KPiBTZW50OiBNb25k
YXksIE1hcmNoIDE5LCAyMDE4IDM6MzYgUE0NCj4gVG86IEdvdSwgSG9uZ21laTsgbWV0YS1hcmFn
b0BhcmFnby1wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtYXJhZ29dIFtFWFRFUk5B
TF0gW21ldGEtcHJvY2Vzc29yLXNkayA1LzZdIFtQQVRDSF0NCj4gdGlvdngtYXBwLWhvc3Q6IGVu
YWJsZSBjb21waWxhdGlvbiBvZiBhcHAtaG9zdCBhbmQgdHV0b3JpYWwgZXhhbXBsZSBvbg0KPiB0
YXJnZXQNCj4gDQo+IA0KPiANCj4gT24gMy8xOS8yMDE4IDM6MDQgUE0sIEphY29iIFN0aWZmbGVy
IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiAzLzE5LzIwMTggMjozNSBQTSwgSG9uZ21laSBHb3Ug
d3JvdGU6DQo+ID4+ICogQ29weSBzb3VyY2UgZmlsZXMgYW5kIG1ha2VmaWxlcyB0byB0YXJnZXQN
Cj4gPj4gKiBDcmVhdGUgc2V0ZW52LnNoIGFuZCBjb3B5IGl0IHRvIHRhcmdldA0KPiA+PiAqIENy
ZWF0ZSBleGFtcGxlcyBwYWNrYWdlIHdpdGggdGlvdngtbGliLWhvc3QgZGVwZW5kZW5jaWVzIHNw
ZWNpZmllZA0KPiA+PiAqIEJ1aWxkIHByb2NlZHVyZSBvbiB0YXJnZXQ6ICJzb3VyY2Ugc2V0ZW52
LnNoOyBtYWtlIg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBIb25nbWVpIEdvdSA8YTAyNzE1
MjlAdGkuY29tPg0KPiA+PiAtLS0NCj4gPj4gwqAgcmVjaXBlcy10aS90aW92eC90aW92eC1hcHAt
aG9zdC5iYiB8IDIzICsrKysrKysrKysrKysrKysrKysrKy0tDQo+ID4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0t
Z2l0IGEvcmVjaXBlcy10aS90aW92eC90aW92eC1hcHAtaG9zdC5iYg0KPiA+PiBiL3JlY2lwZXMt
dGkvdGlvdngvdGlvdngtYXBwLWhvc3QuYmINCj4gPj4gaW5kZXggZWIzMTJiMy4uMDkzMDI1ZSAx
MDA2NDQNCj4gPj4gLS0tIGEvcmVjaXBlcy10aS90aW92eC90aW92eC1hcHAtaG9zdC5iYg0KPiA+
PiArKysgYi9yZWNpcGVzLXRpL3Rpb3Z4L3Rpb3Z4LWFwcC1ob3N0LmJiDQo+ID4+IEBAIC00LDEz
ICs0LDE5IEBAIERFU0NSSVBUSU9OID0gIlRJIE9wZW5WWCBpbXBsZW1lbnRhdGlvbiwgVElPVlgs
DQo+ID4+IGluY2x1ZGVzIEtocm9ub3MgZGVmaW5lZCBjb25mb3JtDQo+ID4+IMKgIExJQ0VOU0Ug
PSAiQlNELTMtQ2xhdXNlICYgTUlUIg0KPiA+PiDCoCBMSUNfRklMRVNfQ0hLU1VNID0NCj4gPj4g
ImZpbGU6Ly9kb2NzL21hbmlmZXN0L1RJT1ZYLUFQUC0NCj4gSE9TVF8wMS4wMC4wMS4wMF9tYW5p
ZmVzdC5odG1sO21kNT0yNDdkN2M1NmQ3ODNmNTgzYmY4MDI0OTBkNWM5M2RiMw0KPiAiDQo+ID4+
IMKgICtGSUxFU0VYVFJBUEFUSFNfcHJlcGVuZCA6PSAiJHtUSElTRElSfS9maWxlczoiDQo+ID4+
ICsNCj4gPj4gK1NSQ19VUklfYXBwZW5kICs9ICJcDQo+ID4+ICvCoMKgwqDCoCBmaWxlOi8vc2V0
ZW52LnNoIFwNCj4gPj4gKyINCj4gDQo+IEFuZCBzZXRlbnYuc2ggd2FzIG5vdCBhZGRlZCBpbiB0
aGlzIHBhdGNoLg0KPiANCj4gPj4gKw0KPiA+PiDCoCByZXF1aXJlIHJlY2lwZXMtdGkvaW5jbHVk
ZXMvdGlzZGstcGF0aHMuaW5jDQo+ID4+IMKgIHJlcXVpcmUgdGlvdngtc3lzLmluYw0KPiA+PiDC
oCDCoCBERVBFTkRTID0gIiB0aW92eC1zeXMtaWZhY2UgdGlvdngtbGliLWhvc3QgdGktaXBjIGNt
ZW0gb3BlbmN2Ig0KPiA+PiDCoCBSREVQRU5EU18ke1BOfSA9ICIgdGlvdngtc3lzLWlmYWNlIHRp
b3Z4LXN5cy1pZmFjZS1maXJtd2FyZQ0KPiA+PiB0aW92eC1saWItaG9zdCB0aS1pcGMgY21lbSAi
DQo+ID4+IMKgIC1QUiA9ICJyMSINCj4gPj4gK1BSID0gInIyIg0KPiA+PiDCoCDCoCBDT01QQVRJ
QkxFX01BQ0hJTkUgPSAiZHJhN3h4Ig0KPiA+PiDCoCBQQUNLQUdFX0FSQ0ggPSAiJHtNQUNISU5F
X0FSQ0h9Ig0KPiA+PiBAQCAtMjgsMTAgKzM0LDIzIEBAIGRvX2luc3RhbGwgKCkgew0KPiA+PiDC
oMKgwqDCoMKgIGluc3RhbGwgLWQgJHtEfSR7YmluZGlyfS8NCj4gPj4gwqDCoMKgwqDCoCBpbnN0
YWxsIC1tIDA3NTUgJHtTfS9ob3N0L2Jpbi9kZWJ1Zy9hcHBfaG9zdA0KPiA+PiAke0R9JHtiaW5k
aXJ9L3Rpb3Z4LWFwcF9ob3N0DQo+ID4+IMKgwqDCoMKgwqAgaW5zdGFsbCAtbSAwNzU1ICR7U30v
a2hyb25vc19leGFtcGxlL2Jpbi9kZWJ1Zy9vcHRpY2FsZmxvdw0KPiA+PiAke0R9JHtiaW5kaXJ9
L3Rpb3Z4LW9wdGljYWxmbG93DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBvZV9ydW5tYWtlIGNsZWFu
DQo+ID4+ICvCoMKgwqAgaW5zdGFsbCAtZCAke0R9JHtkYXRhZGlyfS90aS9leGFtcGxlcy9vcGVu
dngNCj4gPj4gK8KgwqDCoCBpbnN0YWxsIC1tIDY0NCAke1N9L3Byb2R1Y3RzLm1haw0KPiA+PiAr
JHtEfSR7ZGF0YWRpcn0vdGkvZXhhbXBsZXMvb3BlbnZ4DQo+ID4+ICvCoMKgwqAgaW5zdGFsbCAt
bSA2NDQgJHtTfS9tYWtlZmlsZSAke0R9JHtkYXRhZGlyfS90aS9leGFtcGxlcy9vcGVudngNCj4g
Pj4gK8KgwqDCoCBpbnN0YWxsIC1tIDY0NCAke1dPUktESVJ9L3NldGVudi5zaA0KPiA+PiAke0R9
JHtkYXRhZGlyfS90aS9leGFtcGxlcy9vcGVudngNCj4gPj4gK8KgwqDCoCBjcCAtciAke1N9L2hv
c3QgJHtEfSR7ZGF0YWRpcn0vdGkvZXhhbXBsZXMvb3BlbnZ4DQo+ID4+ICvCoMKgwqAgY3AgLXIg
JHtTfS9raHJvbm9zX2V4YW1wbGUgJHtEfSR7ZGF0YWRpcn0vdGkvZXhhbXBsZXMvb3BlbnZ4DQo+
ID4+ICvCoMKgwqAgY3AgLXIgJHtTfS9zaGFyZWQgJHtEfSR7ZGF0YWRpcn0vdGkvZXhhbXBsZXMv
b3BlbnZ4DQo+ID4+IMKgIH0NCj4gPj4gwqAgK1BBQ0tBR0VTICs9ICIke1BOfS1leGFtcGxlcyIN
Cj4gPj4gK0ZJTEVTXyR7UE59LWV4YW1wbGVzID0gIiR7ZGF0YWRpcn0vdGkvZXhhbXBsZXMvb3Bl
bnZ4Ig0KPiA+PiArUkRFUEVORFNfJHtQTn0tZXhhbXBsZXMgPSAidGlvdngtbGliLWhvc3Qtc3Rh
dGljZGV2IHRpb3Z4LWxpYi1ob3N0LQ0KPiBkZXYiDQo+ID4+ICsNCj4gPj4gwqAgQ1JFQVRFX1NS
Q0lQSyA9ICIxIg0KPiA+PiDCoCBTUkNJUEtfSU5TVEFMTF9ESVIgPSAiZXhhbXBsZS1hcHBsaWNh
dGlvbnMvJHtQTn0tJHtQVn0iDQo+ID4+IMKgIMKgIEZJTEVTXyR7UE59ICs9ICIke2JpbmRpcn0v
KiINCj4gPj4gLUlOU0FORV9TS0lQXyR7UE59ID0gImxkZmxhZ3MiDQo+ID4+ICtJTlNBTkVfU0tJ
UF8ke1BOfSA9ICJsZGZsYWdzIGRldi1kZXBzIg0KPiA+DQo+ID4gSXMgdGhpcyBkZXYtZGVwcyBz
a2lwIG5lY2Vzc2FyeT8gTm90aGluZyBjaGFuZ2VkIGluIHRoZSBkZXBlbmRlbmNpZXMNCj4gPiBv
ZiB0aGUgbWFpbiBwYWNrYWdlLg0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBtZXRhLWFyYWdvIG1haWxpbmcgbGlzdA0KPiA+IG1l
dGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj4gPiBodHRwOi8vYXJhZ28tcHJvamVjdC5vcmcv
Y2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL21ldGEtYXJhZ28NCg0K

