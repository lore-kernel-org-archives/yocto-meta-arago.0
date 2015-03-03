Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: from smtpcmd01229.aruba.it (smtpcmd01229.aruba.it [62.149.158.229])
	by arago-project.org (Postfix) with ESMTP id EEE19529BD
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 11:52:42 +0000 (UTC)
Received: from phoenixsoftware.it ([62.149.158.90])
	by smtpcmd01.ad.aruba.it with bizsmtp
	id yzsg1p0271xJdJu01zsgPL; Tue, 03 Mar 2015 12:52:41 +0100
Date: Tue,  3 Mar 2015 12:52:40 +0100
Message-Id: <NKMWZS$94E5E748F875A98FA60773BAEEF601E6@phoenixsoftware.it>
MIME-Version: 1.0
X-Sensitivity: 3
From: "Pierluigi Passaro" <pierluigi.passaro@phoenixsoftware.it>
To: "meta-arago" <meta-arago@arago-project.org>
X-XaM3-API-Version: V3(R2)
X-notifreq: 123
X-SenderIP: 94.33.39.20
Subject: Compile ti-compat-wireless-wl18xx with Linaro GCC 4.9-2014.09
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
X-List-Received-Date: Tue, 03 Mar 2015 11:52:43 -0000
X-Groupsio-MsgNum: 4946
Content-Type: multipart/mixed;
	boundary="_=__=_XaM3_.1425383560.2A.723764.42.26670.52.42.007.1579815474"

--_=__=_XaM3_.1425383560.2A.723764.42.26670.52.42.007.1579815474
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,=0AGCC 4.9 complains about using __TIMESTAMP__ defines in source c=
ode.=0A=0AAttached you can find the patch I used to fix the problem.=0APl=
ease fill free to commit it, if fine.=0A=0ARegards=0APierluigi

--_=__=_XaM3_.1425383560.2A.723764.42.26670.52.42.007.1579815474
Content-Type: application/octet-stream;
	name="=?utf-8?Q?ti-compat-wireless-wl18xx.patch?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="=?utf-8?Q?ti-compat-wireless-wl18xx.patch?="

ZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtYnNwL3RpLWNvbXBhdC13aXJl
bGVzcy90aS1jb21wYXQtd2lyZWxlc3Mtd2wxOHh4LmJiIGIvbWV0YS1hcmFnby1leHRyYXMvcmVj
aXBlcy1ic3AvdGktY29tcGF0LXdpcmVsZXNzL3RpLWNvbXBhdC13aXJlbGVzcy13bDE4eHguYmIK
aW5kZXggYjIxZmNhNC4uMzFmZTBiMSAxMDA2NDQKLS0tIGEvbWV0YS1hcmFnby1leHRyYXMvcmVj
aXBlcy1ic3AvdGktY29tcGF0LXdpcmVsZXNzL3RpLWNvbXBhdC13aXJlbGVzcy13bDE4eHguYmIK
KysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1ic3AvdGktY29tcGF0LXdpcmVsZXNzL3Rp
LWNvbXBhdC13aXJlbGVzcy13bDE4eHguYmIKQEAgLTMyLDYgKzMyLDExIEBAIGV4cG9ydCBLTElC
X0JVSUxEPSIke1NUQUdJTkdfS0VSTkVMX0RJUn0iCiBleHBvcnQgS0xJQj0iJHtEfSIKIAogZG9f
Y29uZmlndXJlKCkgeworICAgIGNkICIke1dPUktESVJ9L3dsMTh4eCIKKyAgICBleHBvcnQgR0lU
U1RBTVA9JChnaXQgbG9nIC0xIC0tZm9ybWF0PSVjZCkKKyAgICBzZWQgLWkgInMvX19USU1FU1RB
TVBfXy9cIiRHSVRTVEFNUFwiLyIgZHJpdmVycy9uZXQvd2lyZWxlc3MvdGkvd2xjb3JlL01ha2Vm
aWxlCisgICAgc2VkIC1pICJzL19fVElNRVNUQU1QX18vXCIkR0lUU1RBTVBcIi8iIGRyaXZlcnMv
bmV0L3dpcmVsZXNzL3RpL3dsY29yZS9yZWxlYXNlX3ZlcnNpb24uaAorCiAgICAgY2QgIiR7V09S
S0RJUn0vYmFja3BvcnRzIgogICAgIHVuc2V0IENDCiAgICAgI0dlbmVyYXRlIGNvbXBhdC13aXJl
bGVzcwo=

--_=__=_XaM3_.1425383560.2A.723764.42.26670.52.42.007.1579815474--
