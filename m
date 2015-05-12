Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D2BC6529AE
	for <meta-arago@arago-project.org>;
	Tue, 12 May 2015 00:12:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4C0CEiQ000509
	for <meta-arago@arago-project.org>; Mon, 11 May 2015 19:12:14 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4C0CDrf013759
	for <meta-arago@arago-project.org>; Mon, 11 May 2015 19:12:14 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 11 May 2015 19:12:13 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-console: Add iproute2
	tc	package
Thread-Index: AdCMSEuGxEkqkMmtPUaf4ove1J914A==
Date: Tue, 12 May 2015 00:12:12 +0000
Message-ID: <165e40a1-f8d3-4b60-85d2-59e88805da07@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-console: Add iproute2 tc	package
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
X-List-Received-Date: Tue, 12 May 2015 00:12:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_165e40a1f8d34b6085d259e88805da07emailandroidcom_"

--_000_165e40a1f8d34b6085d259e88805da07emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWNrDQoNCi0tDQpEZW55cw0KDQpPbiBNYXkgMTEsIDIwMTUgMjA6MDksICJOZWxzb24sIFNhbSIg
PHNhbS5uZWxzb25AdGkuY29tPiB3cm90ZToNCi0gVG9vbCB1c2VmdWwgdG8gc2hvdyAvIG1hbmlw
dWxhdGUgdHJhZmZpYyBjb250cm9sIHNldHRpbmdzDQoNClNpZ25lZC1vZmYtYnk6IFNhbSBOZWxz
b24gPHNhbS5uZWxzb25AdGkuY29tPg0KLS0tDQogLi4uL3BhY2thZ2Vncm91cHMvcGFja2FnZWdy
b3VwLWFyYWdvLWNvbnNvbGUuYmIgICAgfCAgICAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9w
YWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby1jb25zb2xlLmJiIGIvbWV0YS1hcmFnby1k
aXN0cm8vcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWFyYWdvLWNvbnNv
bGUuYmINCmluZGV4IGJhYTZiY2EuLmQ3MDY5MzggMTAwNjQ0DQotLS0gYS9tZXRhLWFyYWdvLWRp
c3Ryby9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJhZ28tY29uc29s
ZS5iYg0KKysrIGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMv
cGFja2FnZWdyb3VwLWFyYWdvLWNvbnNvbGUuYmINCkBAIC01MSw2ICs1MSw3IEBAIEFSQUdPX1VU
SUxTID0gIlwNCiAgICAgdXNidXRpbHMgXA0KICAgICBpMmMtdG9vbHMgXA0KICAgICBpcHJvdXRl
MiBcDQorICAgIGlwcm91dGUyLXRjIFwNCiAgICAgc3RyYWNlIFwNCiAgICAgbHRyYWNlIFwNCiAg
ICAgJHtAYmFzZV9jb250YWlucygnTUFDSElORV9GRUFUVVJFUycsICdwY2knLCAncGNpdXRpbHMn
LCAnJyxkKX0gXA0KLS0NCjEuNy45LjUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCm1ldGEtYXJhZ28gbWFpbGluZyBsaXN0DQptZXRhLWFyYWdvQGFy
YWdvLXByb2plY3Qub3JnDQpodHRwOi8vYXJhZ28tcHJvamVjdC5vcmcvY2dpLWJpbi9tYWlsbWFu
L2xpc3RpbmZvL21ldGEtYXJhZ28NCg==

--_000_165e40a1f8d34b6085d259e88805da07emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F1AF87ABE3C999488CF1827FD26EBAAD@owa.mail.ti.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPHAgZGlyPSJsdHIi
PkFjazwvcD4NCjxwIGRpcj0ibHRyIj4tLSA8YnI+DQpEZW55czwvcD4NCjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj5PbiBNYXkgMTEsIDIwMTUgMjA6MDksICZxdW90O05lbHNvbiwgU2FtJnF1b3Q7
ICZsdDtzYW0ubmVsc29uQHRpLmNvbSZndDsgd3JvdGU6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj4N
CjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRl
ci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj48Zm9udCBzaXpl
PSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwcHQiPjwvc3Bhbj48L2ZvbnQ+DQo8ZGl2Pi0g
VG9vbCB1c2VmdWwgdG8gc2hvdyAvIG1hbmlwdWxhdGUgdHJhZmZpYyBjb250cm9sIHNldHRpbmdz
PGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogU2FtIE5lbHNvbiAmbHQ7c2FtLm5lbHNvbkB0aS5j
b20mZ3Q7PGJyPg0KLS0tPGJyPg0KJm5ic3A7Li4uL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3Vw
LWFyYWdvLWNvbnNvbGUuYmImbmJzcDsmbmJzcDsmbmJzcDsgfCZuYnNwOyZuYnNwOyZuYnNwOyAx
ICYjNDM7PGJyPg0KJm5ic3A7MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCYjNDM7KTxicj4N
Cjxicj4NCmRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2Fn
ZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJhZ28tY29uc29sZS5iYiBiL21ldGEtYXJhZ28tZGlzdHJv
L3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby1jb25zb2xlLmJi
PGJyPg0KaW5kZXggYmFhNmJjYS4uZDcwNjkzOCAxMDA2NDQ8YnI+DQotLS0gYS9tZXRhLWFyYWdv
LWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJhZ28tY29u
c29sZS5iYjxicj4NCiYjNDM7JiM0MzsmIzQzOyBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMt
Y29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby1jb25zb2xlLmJiPGJyPg0KQEAg
LTUxLDYgJiM0Mzs1MSw3IEBAIEFSQUdPX1VUSUxTID0gJnF1b3Q7XDxicj4NCiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyB1c2J1dGlscyBcPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGky
Yy10b29scyBcPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlwcm91dGUyIFw8YnI+DQom
IzQzOyZuYnNwOyZuYnNwOyZuYnNwOyBpcHJvdXRlMi10YyBcPGJyPg0KJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IHN0cmFjZSBcPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGx0cmFjZSBc
PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICR7QGJhc2VfY29udGFpbnMoJ01BQ0hJTkVf
RkVBVFVSRVMnLCAncGNpJywgJ3BjaXV0aWxzJywgJycsZCl9IFw8YnI+DQotLSA8YnI+DQoxLjcu
OS41PGJyPg0KPGJyPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX188YnI+DQptZXRhLWFyYWdvIG1haWxpbmcgbGlzdDxicj4NCm1ldGEtYXJhZ29AYXJhZ28t
cHJvamVjdC5vcmc8YnI+DQo8YSBocmVmPSJodHRwOi8vYXJhZ28tcHJvamVjdC5vcmcvY2dpLWJp
bi9tYWlsbWFuL2xpc3RpbmZvL21ldGEtYXJhZ28iPmh0dHA6Ly9hcmFnby1wcm9qZWN0Lm9yZy9j
Z2ktYmluL21haWxtYW4vbGlzdGluZm8vbWV0YS1hcmFnbzwvYT48YnI+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_165e40a1f8d34b6085d259e88805da07emailandroidcom_--
