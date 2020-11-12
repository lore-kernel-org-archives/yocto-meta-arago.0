Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C9C6D529C6
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 20:23:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACKK8s2107926;
	Thu, 12 Nov 2020 14:20:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605212408;
	bh=PdB0nWmhRIt6pI/CRDIHkM8kLrthui2pJ7+JgpXfN8M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=MQHGMygzR2Bh0j0VikbE1YFgSktsi5KjVkeUUQ6Si4Dd2tEjw9T7BZ0puluf5FZof
	+fTbdz4vuYWIXqqL+ZqOCGBXnRs612GMKy5eP8Re92o6hLLRfhk8mO9jFlJ6S0TEKw
	0KwHBfDWforGOv6JHAIZuD6srTrpRIWxkrBYhkso=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACKK8QI111307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2020 14:20:08 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 12 Nov 2020 14:20:08 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Thu, 12 Nov 2020 14:20:08 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Thread-Topic: [EXTERNAL] [meta-arago] [master/dunfell PATCH]
	matrix-gui-pm-demos: Allow empty package
Thread-Index: AQHWs1/fJtY5Eu0j7kieBz/loz3GDam6I15AgAEScQCAABXMUIAISWaA//+nxZCAAgQYAP//tY/Q
Date: Thu, 12 Nov 2020 20:20:08 +0000
Message-ID: <2f6532709d5a41c3a8f25d11e5a29961@ti.com>
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
	<CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
	<bcf4433b6a8d4758a56eb570f1e84695@ti.com>
	<CAM9ZRVt7Y1gZzCtTeO9d1tBnVg05OWY3pNYxyGNucxti-PwUtg@mail.gmail.com>
	<3a19d70d925149708e184809dbdd83dc@ti.com>
	<CAM9ZRVuOJ84McAoidNPcEM+ZVq72TtN1c+gyb8LDHJ6KxJ43xA@mail.gmail.com>
In-Reply-To: <CAM9ZRVuOJ84McAoidNPcEM+ZVq72TtN1c+gyb8LDHJ6KxJ43xA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.34.199]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [master/dunfell PATCH] matrix-gui-pm-demos: Allow empty package
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
X-List-Received-Date: Thu, 12 Nov 2020 20:23:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBhdWwgQmFya2VyIDxwYmFy
a2VyQGtvbnN1bGtvLmNvbT4NCj5TZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTIsIDIwMjAgMTI6
MjggUE0NCj5UbzogVGFtbWFuYSwgR293dGhhbSA8Zy10YW1tYW5hQHRpLmNvbT4NCj5DYzogbWV0
YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KPlN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFttZXRh
LWFyYWdvXSBbbWFzdGVyL2R1bmZlbGwgUEFUQ0hdIG1hdHJpeC1ndWktcG0tDQo+ZGVtb3M6IEFs
bG93IGVtcHR5IHBhY2thZ2UNCj4NCj5PbiBUaHUsIDEyIE5vdiAyMDIwIGF0IDE3OjQyLCBUYW1t
YW5hLCBHb3d0aGFtIDxnLXRhbW1hbmFAdGkuY29tPiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+ID4t
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gPkZyb206IFBhdWwgQmFya2VyIDxwYmFya2Vy
QGtvbnN1bGtvLmNvbT4NCj4+ID5TZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDExLCAyMDIwIDEw
OjU2IEFNDQo+PiA+VG86IFRhbW1hbmEsIEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+DQo+PiA+
Q2M6IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj4+ID5TdWJqZWN0OiBSZTogW0VYVEVS
TkFMXSBbbWV0YS1hcmFnb10gW21hc3Rlci9kdW5mZWxsIFBBVENIXSBtYXRyaXgtZ3VpLQ0KPnBt
LQ0KPj4gPmRlbW9zOiBBbGxvdyBlbXB0eSBwYWNrYWdlDQo+PiA+DQo+PiA+T24gRnJpLCA2IE5v
diAyMDIwIGF0IDIyOjQ1LCBUYW1tYW5hLCBHb3d0aGFtIDxnLXRhbW1hbmFAdGkuY29tPiB3cm90
ZToNCj4+ID4+DQo+PiA+Pg0KPj4gPj4NCj4+ID4+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4gPj4gPkZyb206IFBhdWwgQmFya2VyIDxwYmFya2VyQGtvbnN1bGtvLmNvbT4NCj4+ID4+
ID5TZW50OiBGcmlkYXksIE5vdmVtYmVyIDA2LCAyMDIwIDM6MDYgQU0NCj4+ID4+ID5UbzogVGFt
bWFuYSwgR293dGhhbSA8Zy10YW1tYW5hQHRpLmNvbT4NCj4+ID4+ID5DYzogbWV0YS1hcmFnb0Bh
cmFnby1wcm9qZWN0Lm9yZw0KPj4gPj4gPlN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFttZXRhLWFy
YWdvXSBbbWFzdGVyL2R1bmZlbGwgUEFUQ0hdIG1hdHJpeC0NCj5ndWktDQo+PiA+cG0tDQo+PiA+
PiA+ZGVtb3M6IEFsbG93IGVtcHR5IHBhY2thZ2UNCj4+ID4+ID4NCj4+ID4+ID5PbiBUaHUsIDUg
Tm92IDIwMjAgYXQgMjI6NTQsIFRhbW1hbmEsIEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+DQo+
d3JvdGU6DQo+PiA+PiA+Pg0KPj4gPj4gPj4gPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
PiA+PiA+PiA+RnJvbTogbWV0YS1hcmFnby1ib3VuY2VzQGFyYWdvLXByb2plY3Qub3JnIDxtZXRh
LWFyYWdvLQ0KPj4gPmJvdW5jZXNAYXJhZ28tDQo+PiA+PiA+PiA+cHJvamVjdC5vcmc+IE9uIEJl
aGFsZiBPZiBQYXVsIEJhcmtlcg0KPj4gPj4gPj4gPlNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAw
NSwgMjAyMCA0OjM4IEFNDQo+PiA+PiA+PiA+VG86IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5v
cmcNCj4+ID4+ID4+ID5TdWJqZWN0OiBbRVhURVJOQUxdIFttZXRhLWFyYWdvXSBbbWFzdGVyL2R1
bmZlbGwgUEFUQ0hdIG1hdHJpeC0NCj5ndWktDQo+PiA+cG0tDQo+PiA+PiA+PiA+ZGVtb3M6IEFs
bG93IGVtcHR5IHBhY2thZ2UNCj4+ID4+ID4+ID4NCj4+ID4+ID4+ID5UaGUgbWF0cml4LWd1aS1w
bS1kZW1vcyByZWNpcGUgc3BsaXRzIGl0cyBiaW5hcmllcyBpbnRvIHNldmVyYWwNCj4+ID4+ID4+
ID5zdWJwYWNrYWdlcyBsZWF2aW5nIHRoZSBkZWZhdWx0IHBhY2thZ2UgZW1wdHkuIFRoZSBkZXBl
bmRlbmNpZXMNCj5mb3INCj4+ID50aGUNCj4+ID4+ID4+ID5kZWZhdWx0IHBhY2thZ2UgYXJlIHNl
dCBzbyBpdCBtYWtlcyBzZW5zZSB0byBhbGxvdyB0aGlzIGVtcHR5DQo+PiA+cGFja2FnZQ0KPj4g
Pj4gPnRvDQo+PiA+PiA+PiA+YmUgY3JlYXRlZC4NCj4+ID4+ID4+ID4NCj4+ID4+ID4+ID5TaWdu
ZWQtb2ZmLWJ5OiBQYXVsIEJhcmtlciA8cGJhcmtlckBrb25zdWxrby5jb20+DQo+PiA+PiA+PiA+
LS0tDQo+PiA+PiA+PiA+IG1ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtY29yZS9tYXRyaXgvbWF0
cml4LWd1aS1wbS1kZW1vc18yLjAuYmINCj58DQo+PiA+MSArDQo+PiA+PiA+PiA+IDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4gPj4gPj4gPg0KPj4gPj4gPj4gPmRpZmYgLS1naXQg
YS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktcG0tDQo+
PiA+PiA+PiA+ZGVtb3NfMi4wLmJiIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21h
dHJpeC9tYXRyaXgtZ3VpLQ0KPnBtLQ0KPj4gPj4gPj4gPmRlbW9zXzIuMC5iYg0KPj4gPj4gPj4g
PmluZGV4IDAxMTZmNWVhLi5hOWViYjg0ZiAxMDA2NDQNCj4+ID4+ID4+ID4tLS0gYS9tZXRhLWFy
YWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktcG0tDQo+PiA+ZGVtb3Nf
Mi4wLmJiDQo+PiA+PiA+PiA+KysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21h
dHJpeC9tYXRyaXgtZ3VpLXBtLQ0KPj4gPmRlbW9zXzIuMC5iYg0KPj4gPj4gPj4gPkBAIC0xMCw2
ICsxMCw3IEBAIFMgPSAiJHtXT1JLRElSfS9naXQvcG93ZXJfYXBwcyINCj4+ID4+ID4+ID4NCj4+
ID4+ID4+ID4gIyBNYWtlIHN1cmUgcG93ZXIgc3VibWVudSBhbmQgYXBwIGltYWdlcyBoYXMgYmVl
biBpbnN0YWxsZWQNCj4+ID4+ID4+ID4gUkRFUEVORFNfJHtQTn0gKz0gIm1hdHJpeC1ndWktYXBw
cy1pbWFnZXMgbWF0cml4LWd1aS1zdWJtZW51cy0NCj5wb3dlcg0KPj4gPj4gPj4gPm1hdHJpeC1n
dWktZ2VuZXJpYy1wbSINCj4+ID4+ID4+ID4rQUxMT1dfRU1QVFlfJHtQTn0gPSAiMSINCj4+ID4+
ID4+DQo+PiA+PiA+PiBKdXN0IGN1cmlvdXMsIEkgYXNzdW1lIHRoYXQgdGhlIGRlcGxveW1lbnQg
b2YgdGhlIGRlcGVuZGVudA0KPnBhY2thZ2VzDQo+PiA+aXMNCj4+ID4+ID5zdGlsbA0KPj4gPj4g
Pj4gZW5zdXJlZCBldmVuIHdpdGhvdXQgdGhpcyBjaGFuZ2UuIFRoaXMganVzdCBtYWtlcyBpdCBh
cHBhcmVudCB0bw0KPnRoZQ0KPj4gPj4gPnVzZXIgdGhhdA0KPj4gPj4gPj4gdGhlIGRlZmF1bHQg
cGFja2FnZSBpcyBlbXB0eS4gT3IgaXMgaXQgdGhhdCB0aGUgZGVwbG95bWVudCBvZg0KPj4gPmRl
cGVuZGVudA0KPj4gPj4gPnBhY2thZ2VzDQo+PiA+PiA+PiBpcyBicm9rZW4gd2l0aG91dCB0aGlz
Lg0KPj4gPj4gPg0KPj4gPj4gPldpdGhvdXQgdGhpcyBjaGFuZ2UgdGhlIG1hdHJpeC1ndWktcG0t
ZGVtb3MgcGFja2FnZSBpcyBub3QgY3JlYXRlZA0KPmFuZA0KPj4gPj4gPmNhbm5vdCBiZSBpbnN0
YWxsZWQuDQo+PiA+Pg0KPj4gPj4gWWVzLCBidXQgYXMgdGhlIHBhY2thZ2UgaGVyZSBpcyBlbXB0
eSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aHkgaXQNCj5uZWVkcw0KPj4gPnRvDQo+PiA+PiBiZSBp
bnN0YWxsZWQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPj4gPj4NCj4+ID4+IE5vdyB0aGF0IHRoZSBw
YWNrYWdlIGlzIGNyZWF0ZWQsIHdvbmRlcmluZyBpZiB0aGUgZGVwZW5kZW5jaWVzIHdpdGgNCj50
aGUNCj4+ID4+IHN1Yi1wYWNrYWdlcyBuZWVkcyB0byBiZSBsaXN0ZWQgYXMgd2VsbCBzb21ldGhp
bmcgbGlrZQ0KPj4gPj4NCj4+ID4+IFJERVBFTkRTXyR7UE59ICs9ICR7UE59LTxzdWJwYWNrYWdl
c30gb3INCj4+ID4+DQo+PiA+PiBSREVQRU5EU18ke1BOfS08c3VicGFja2FnZXM+ID0gJHtQTn0N
Cj4+ID4NCj4+ID5JJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgY29tbWVudCBoZXJlLiBS
REVQRU5EU18ke1BOfSBpcyBzZXQgb24NCj4+ID50aGUgbGluZSBhYm92ZSBteSBjaGFuZ2UuIFNv
IGVmZmVjdGl2ZWx5ICR7UE59IGlzIGEgcGFja2FnZWdyb3VwIHdoaWNoDQo+PiA+d2lsbCBpbnN0
YWxsIHRoZSBsaXN0ZWQgZGVwZW5kZW5jaWVzLiBCdXQgd2l0aG91dCBBTExPV19FTVBUWSBiZWlu
Zw0KPj4gPnNldCBpdCB3b24ndCBiZSBjcmVhdGVkLg0KPj4gPg0KPj4gPlRoZSBvdGhlciB0aGlu
ZyB0byBjb25zaWRlciBpcyB0aGF0ICR7UE59IGlzIGEgZGVmYXVsdCBkZXBlbmRlbmN5IG9mDQo+
PiA+JHtQTn0tZGV2IGFuZCBzbyBub3QgY3JlYXRpbmcgYSAke1BOfSBwYWNrYWdlIGNhbiByZXN1
bHQgaW4gaW1hZ2UNCj4+ID5mZWF0dXJlcyBsaWtlIGRldi1wa2dzIGJyZWFraW5nLg0KPj4NCj4+
IFRoZSBjb21tZW50IHdhcyBmb3IgdGhlIGRlcGVuZGVuY2llcyBmb3IgdGhlIHN1Yi1wYWNrYWdl
cyAke1BOfS1jb3VudA0KPj4gYW5kIG90aGVycyBoZXJlLiBJIGRvbid0IHRoaW5rICR7UE59IGJl
Y29tZXMgYSBkZWZhdWx0IGRlcGVuZGVuY3kgZm9yDQo+PiBzdWItcGFja2FnZXMuIEF0bGVhc3Qg
dGhlIGBvcGtnIGluc3RhbGxgIG9uIHN1Yi1wYWNrYWdlcyBpcyBub3QgY2hlY2tpbmcNCj4+IG9u
IHRoZSAke1BOfSBkZXBlbmRlbmNpZXMuIEdpdmVuIHRoZXkgYXJlIGRlcGVuZGVuY2llcyBJIHJl
YXNvbmVkIHRoYXQNCj4+IHRoZXkgY2FuIGJlIGFkZGVkIHRvIHRoZSBzdWItcGFja2FnZXMgd2l0
aA0KPj4NCj4+IFJERVBFTkRTLSR7UE59LWNvdW50ICs9ICR7UE59DQo+Pg0KPj4gc28gdGhhdCAk
e1BOfSBsaXN0ZWQgZGVwZW5kZW5jaWVzIGFyZSBpbnN0YWxsZWQgb24gaW5zdGFsbGF0aW9uIG9m
IGFueSBvZg0KPj4gdGhlIHN1Yi1wYWNrYWdlIHdoaWNoIHNlZW1zIHRvIGJlIHdoYXQgdGhlIHJl
Y2lwZSB3YW50cy4NCj4+DQo+PiBJIHNlZSB0aGF0IHRoaXMgcGF0Y2ggaGFzIGJlZW4gbWVyZ2Vk
LiBUaGlzIGNhbiBiZSBhIHNlcGFyYXRlIHBhdGNoLiBJDQo+PiBjYW4gcHVzaCB0aGlzIGNoYW5n
ZSBpZiB5b3Ugd291bGQgbGlrZSBtZSB0by4NCj4NCj5JIGd1ZXNzIHlvdSBhcmUgZGVzY3JpYmlu
ZyBhIGRpZmZlcmVudCBpc3N1ZSBoZXJlLiBBcmUgdGhlDQo+ZGVwZW5kZW5jaWVzIGxpc3RlZCBp
biBSREVQRU5EU18ke1BOfSBzdXBwb3NlZCB0byBhcHBseSB0byB0aGUNCj5zdWJwYWNrYWdlcz8N
Cg0KSSB0aGluayB0aGV5IGFyZSBoZXJlLg0KDQpUaGFua3MsDQpHb3d0aGFtDQoNCg==

