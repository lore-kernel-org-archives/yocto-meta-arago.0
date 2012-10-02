Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id BA9FD529A4
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2012 00:35:18 +0000 (UTC)
Received: by oagn12 with SMTP id n12so5944671oag.38
	for <meta-arago@arago-project.org>;
	Mon, 01 Oct 2012 17:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/BLOl+uqsQ2LHXFMzhlURVCNrYvjJaInHSucK1vCUrU=;
	b=yjuelx7Om0t/bo6M4MG/qcEqDOMkO+88ME3eqH8461zWgMNoMtK7L65O3B9X32vd3i
	n9sBIuAvIqC6sBhaYGUGncGRt74rCjKys4usKPsYKO/2VWxbtuEMaOwe13wNeOjNPWxm
	oVA3hjrQJvh0J9LYX3Yuq1ajbDtUQJ28iA7kELxijtK/BDIEy96D/48QhD/DuXZ/oP91
	/RQisLudbRW5ZggZIAM51dig5PbF9vRetXNjzDEfwnKLXPb7Tyzy9E6pZVbQRAhYwDKZ
	HNw3UUDnwVUmHpmP0YQ6nO8MAT+7DDEtsnNcIQpKiFKxsocenl8BVah9OzfVTjJilcxo
	5jcw==
Received: by 10.60.30.168 with SMTP id t8mr13321050oeh.89.1349138118214;
	Mon, 01 Oct 2012 17:35:18 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 4sm13647395oew.10.2012.10.01.17.35.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 17:35:17 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon,  1 Oct 2012 20:02:27 -0500
Message-Id: <1349139747-7157-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] wpa-gui-e: Add arago specific tweaks
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
X-List-Received-Date: Tue, 02 Oct 2012 00:35:19 -0000

* Add two patches to support lower resolution screens
* Add patch that runs a script when establishing a connection with
  an access point.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...-make-the-networkconfig-dialog-scrollable.patch |  863 ++++++++++++++++++++
 ...a-gui-e-fix-display-issue-on-small-screen.patch |  845 +++++++++++++++++++
 ...gger-udhcpc-on-connection-to-new-access-p.patch |   72 ++
 .../wpa-supplicant/wpa-gui-e/connection_script.sh  |    6 +
 .../wpa-supplicant/wpa-gui-e_git.bbappend          |   16 +
 5 files changed, 1802 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpa_gui-make-the-networkconfig-dialog-scrollable.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0002-wpa-gui-e-fix-display-issue-on-small-screen.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0003-wpa-gui-trigger-udhcpc-on-connection-to-new-access-p.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/connection_script.sh
 create mode 100755 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpa_gui-make-the-networkconfig-dialog-scrollable.patch b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpa_gui-make-the-networkconfig-dialog-scrollable.patch
new file mode 100644
index 0000000..944a0e1
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpa_gui-make-the-networkconfig-dialog-scrollable.patch
@@ -0,0 +1,863 @@
+From 0a5df8cc725f6781bf0d8b9478af22357e5f10b4 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Tue, 21 Jun 2011 17:03:53 +0300
+Subject: [PATCH] wpa_gui: make the networkconfig dialog scrollable
+
+Makes the networkconfig dialog scrollable to allow using it on screens
+with low resolution in the "y" axis
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ networkconfig.ui |  817 ++++++++++++++-------------
+ 1 files changed, 409 insertions(+), 408 deletions(-)
+
+diff --git a/networkconfig.ui b/networkconfig.ui
+index 217a8ff..d90bd64 100644
+--- a/networkconfig.ui
++++ b/networkconfig.ui
+@@ -1,434 +1,435 @@
+-<ui version="4.0" >
++<?xml version="1.0" encoding="UTF-8"?>
++<ui version="4.0">
+  <class>NetworkConfig</class>
+- <widget class="QDialog" name="NetworkConfig" >
+-  <property name="geometry" >
++ <widget class="QDialog" name="NetworkConfig">
++  <property name="geometry">
+    <rect>
+     <x>0</x>
+     <y>0</y>
+-    <width>410</width>
+-    <height>534</height>
++    <width>430</width>
++    <height>613</height>
+    </rect>
+   </property>
+-  <property name="windowTitle" >
++  <property name="windowTitle">
+    <string>NetworkConfig</string>
+   </property>
+-  <layout class="QGridLayout" >
+-   <item row="1" column="3" >
+-    <widget class="QPushButton" name="cancelButton" >
+-     <property name="text" >
+-      <string>Cancel</string>
++  <layout class="QGridLayout">
++   <item row="0" column="0">
++    <widget class="QScrollArea" name="scrollArea">
++     <property name="widgetResizable">
++      <bool>true</bool>
+      </property>
+-    </widget>
+-   </item>
+-   <item row="0" column="0" colspan="4" >
+-    <widget class="QFrame" name="frame9" >
+-     <property name="frameShape" >
+-      <enum>QFrame::NoFrame</enum>
+-     </property>
+-     <property name="frameShadow" >
+-      <enum>QFrame::Plain</enum>
+-     </property>
+-     <layout class="QGridLayout" >
+-      <item row="0" column="0" >
+-       <widget class="QLabel" name="ssidLabel" >
+-        <property name="text" >
+-         <string>SSID</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="0" column="1" >
+-       <widget class="QLineEdit" name="ssidEdit" >
+-        <property name="toolTip" >
+-         <string>Network name (Service Set IDentifier)</string>
+-        </property>
+-        <property name="text" >
+-         <string/>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="1" column="0" >
+-       <widget class="QLabel" name="authLabel" >
+-        <property name="text" >
+-         <string>Authentication</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="1" column="1" >
+-       <widget class="QComboBox" name="authSelect" >
+-        <item>
+-         <property name="text" >
+-          <string>Plaintext (open / no authentication)</string>
+-         </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>Static WEP (no authentication)</string>
+-         </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>Static WEP (Shared Key authentication)</string>
++     <widget class="QWidget" name="scrollAreaWidgetContents">
++      <property name="geometry">
++       <rect>
++        <x>0</x>
++        <y>0</y>
++        <width>430</width>
++        <height>613</height>
++       </rect>
++      </property>
++      <layout class="QGridLayout" name="gridLayout">
++       <item row="0" column="0" colspan="4">
++        <widget class="QFrame" name="frame9">
++         <property name="frameShape">
++          <enum>QFrame::NoFrame</enum>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>IEEE 802.1X</string>
++         <property name="frameShadow">
++          <enum>QFrame::Plain</enum>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>WPA-Personal (PSK)</string>
++         <layout class="QGridLayout" name="_2">
++          <item row="0" column="0">
++           <widget class="QLabel" name="ssidLabel">
++            <property name="text">
++             <string>SSID</string>
++            </property>
++           </widget>
++          </item>
++          <item row="0" column="1">
++           <widget class="QLineEdit" name="ssidEdit">
++            <property name="toolTip">
++             <string>Network name (Service Set IDentifier)</string>
++            </property>
++            <property name="text">
++             <string/>
++            </property>
++           </widget>
++          </item>
++          <item row="1" column="0">
++           <widget class="QLabel" name="authLabel">
++            <property name="text">
++             <string>Authentication</string>
++            </property>
++           </widget>
++          </item>
++          <item row="1" column="1">
++           <widget class="QComboBox" name="authSelect">
++            <item>
++             <property name="text">
++              <string>Plaintext (open / no authentication)</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>Static WEP (no authentication)</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>Static WEP (Shared Key authentication)</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>IEEE 802.1X</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>WPA-Personal (PSK)</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>WPA-Enterprise (EAP)</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>WPA2-Personal (PSK)</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>WPA2-Enterprise (EAP)</string>
++             </property>
++            </item>
++           </widget>
++          </item>
++          <item row="2" column="0">
++           <widget class="QLabel" name="encrLabel">
++            <property name="text">
++             <string>Encryption</string>
++            </property>
++           </widget>
++          </item>
++          <item row="2" column="1">
++           <widget class="QComboBox" name="encrSelect">
++            <item>
++             <property name="text">
++              <string>None</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>WEP</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>TKIP</string>
++             </property>
++            </item>
++            <item>
++             <property name="text">
++              <string>CCMP</string>
++             </property>
++            </item>
++           </widget>
++          </item>
++          <item row="3" column="0">
++           <widget class="QLabel" name="pskLabel">
++            <property name="text">
++             <string>PSK</string>
++            </property>
++           </widget>
++          </item>
++          <item row="3" column="1">
++           <widget class="QLineEdit" name="pskEdit">
++            <property name="enabled">
++             <bool>false</bool>
++            </property>
++            <property name="toolTip">
++             <string>WPA/WPA2 pre-shared key or passphrase</string>
++            </property>
++            <property name="whatsThis">
++             <string/>
++            </property>
++            <property name="echoMode">
++             <enum>QLineEdit::Password</enum>
++            </property>
++           </widget>
++          </item>
++          <item row="4" column="0">
++           <widget class="QLabel" name="eapLabel">
++            <property name="text">
++             <string>EAP method</string>
++            </property>
++           </widget>
++          </item>
++          <item row="4" column="1">
++           <widget class="QComboBox" name="eapSelect">
++            <property name="enabled">
++             <bool>false</bool>
++            </property>
++           </widget>
++          </item>
++          <item row="5" column="0">
++           <widget class="QLabel" name="identityLabel">
++            <property name="text">
++             <string>Identity</string>
++            </property>
++           </widget>
++          </item>
++          <item row="5" column="1">
++           <widget class="QLineEdit" name="identityEdit">
++            <property name="enabled">
++             <bool>false</bool>
++            </property>
++            <property name="toolTip">
++             <string>Username/Identity for EAP methods</string>
++            </property>
++           </widget>
++          </item>
++          <item row="6" column="0">
++           <widget class="QLabel" name="passwordLabel">
++            <property name="text">
++             <string>Password</string>
++            </property>
++           </widget>
++          </item>
++          <item row="6" column="1">
++           <widget class="QLineEdit" name="passwordEdit">
++            <property name="enabled">
++             <bool>false</bool>
++            </property>
++            <property name="toolTip">
++             <string>Password for EAP methods</string>
++            </property>
++            <property name="echoMode">
++             <enum>QLineEdit::Password</enum>
++            </property>
++           </widget>
++          </item>
++          <item row="7" column="0">
++           <widget class="QLabel" name="cacertLabel">
++            <property name="text">
++             <string>CA certificate</string>
++            </property>
++           </widget>
++          </item>
++          <item row="7" column="1">
++           <widget class="QLineEdit" name="cacertEdit">
++            <property name="enabled">
++             <bool>false</bool>
++            </property>
++           </widget>
++          </item>
++          <item row="8" column="0" colspan="2">
++           <widget class="QGroupBox" name="wepBox">
++            <property name="enabled">
++             <bool>true</bool>
++            </property>
++            <property name="title">
++             <string>WEP keys</string>
++            </property>
++            <layout class="QGridLayout" name="_3">
++             <item row="0" column="0">
++              <widget class="QRadioButton" name="wep0Radio">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++               <property name="text">
++                <string>key 0</string>
++               </property>
++              </widget>
++             </item>
++             <item row="1" column="0">
++              <widget class="QRadioButton" name="wep1Radio">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++               <property name="text">
++                <string>key 1</string>
++               </property>
++              </widget>
++             </item>
++             <item row="3" column="0">
++              <widget class="QRadioButton" name="wep3Radio">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++               <property name="text">
++                <string>key 3</string>
++               </property>
++              </widget>
++             </item>
++             <item row="2" column="0">
++              <widget class="QRadioButton" name="wep2Radio">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++               <property name="text">
++                <string>key 2</string>
++               </property>
++              </widget>
++             </item>
++             <item row="0" column="1">
++              <widget class="QLineEdit" name="wep0Edit">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++              </widget>
++             </item>
++             <item row="1" column="1">
++              <widget class="QLineEdit" name="wep1Edit">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++              </widget>
++             </item>
++             <item row="2" column="1">
++              <widget class="QLineEdit" name="wep2Edit">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++              </widget>
++             </item>
++             <item row="3" column="1">
++              <widget class="QLineEdit" name="wep3Edit">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++              </widget>
++             </item>
++            </layout>
++           </widget>
++          </item>
++          <item row="9" column="0" colspan="2">
++           <widget class="QGroupBox" name="optionalSettingsBox">
++            <property name="enabled">
++             <bool>true</bool>
++            </property>
++            <property name="title">
++             <string>Optional Settings</string>
++            </property>
++            <layout class="QGridLayout" name="_4">
++             <item row="0" column="1">
++              <widget class="QLineEdit" name="idstrEdit">
++               <property name="toolTip">
++                <string>Network Identification String</string>
++               </property>
++              </widget>
++             </item>
++             <item row="0" column="3">
++              <widget class="QSpinBox" name="prioritySpinBox">
++               <property name="toolTip">
++                <string>Network Priority</string>
++               </property>
++               <property name="maximum">
++                <number>10000</number>
++               </property>
++               <property name="singleStep">
++                <number>10</number>
++               </property>
++              </widget>
++             </item>
++             <item row="0" column="0">
++              <widget class="QLabel" name="idstrLabel">
++               <property name="text">
++                <string>IDString</string>
++               </property>
++              </widget>
++             </item>
++             <item row="0" column="2">
++              <widget class="QLabel" name="priorityLabel">
++               <property name="text">
++                <string>Priority</string>
++               </property>
++              </widget>
++             </item>
++             <item row="1" column="0">
++              <widget class="QLabel" name="phase2Label">
++               <property name="text">
++                <string>Inner auth</string>
++               </property>
++              </widget>
++             </item>
++             <item row="1" column="1">
++              <widget class="QComboBox" name="phase2Select">
++               <property name="enabled">
++                <bool>false</bool>
++               </property>
++              </widget>
++             </item>
++            </layout>
++           </widget>
++          </item>
++         </layout>
++        </widget>
++       </item>
++       <item row="1" column="0">
++        <spacer name="spacer">
++         <property name="orientation">
++          <enum>Qt::Vertical</enum>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>WPA-Enterprise (EAP)</string>
++         <property name="sizeHint" stdset="0">
++          <size>
++           <width>20</width>
++           <height>24</height>
++          </size>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>WPA2-Personal (PSK)</string>
++        </spacer>
++       </item>
++       <item row="1" column="1">
++        <widget class="QPushButton" name="useWpsButton">
++         <property name="enabled">
++          <bool>false</bool>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>WPA2-Enterprise (EAP)</string>
++         <property name="text">
++          <string>WPS</string>
+          </property>
+-        </item>
+-       </widget>
+-      </item>
+-      <item row="2" column="0" >
+-       <widget class="QLabel" name="encrLabel" >
+-        <property name="text" >
+-         <string>Encryption</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="2" column="1" >
+-       <widget class="QComboBox" name="encrSelect" >
+-        <item>
+-         <property name="text" >
+-          <string>None</string>
++        </widget>
++       </item>
++       <item row="1" column="2">
++        <widget class="QPushButton" name="addButton">
++         <property name="text">
++          <string>Add</string>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>WEP</string>
++        </widget>
++       </item>
++       <item row="1" column="3">
++        <widget class="QPushButton" name="removeButton">
++         <property name="enabled">
++          <bool>false</bool>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>TKIP</string>
++         <property name="text">
++          <string>Remove</string>
+          </property>
+-        </item>
+-        <item>
+-         <property name="text" >
+-          <string>CCMP</string>
+-         </property>
+-        </item>
+-       </widget>
+-      </item>
+-      <item row="3" column="0" >
+-       <widget class="QLabel" name="pskLabel" >
+-        <property name="text" >
+-         <string>PSK</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="3" column="1" >
+-       <widget class="QLineEdit" name="pskEdit" >
+-        <property name="enabled" >
+-         <bool>false</bool>
+-        </property>
+-        <property name="toolTip" >
+-         <string>WPA/WPA2 pre-shared key or passphrase</string>
+-        </property>
+-        <property name="whatsThis" >
+-         <string/>
+-        </property>
+-        <property name="echoMode" >
+-         <enum>QLineEdit::Password</enum>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="4" column="0" >
+-       <widget class="QLabel" name="eapLabel" >
+-        <property name="text" >
+-         <string>EAP method</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="4" column="1" >
+-       <widget class="QComboBox" name="eapSelect" >
+-        <property name="enabled" >
+-         <bool>false</bool>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="5" column="0" >
+-       <widget class="QLabel" name="identityLabel" >
+-        <property name="text" >
+-         <string>Identity</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="5" column="1" >
+-       <widget class="QLineEdit" name="identityEdit" >
+-        <property name="enabled" >
+-         <bool>false</bool>
+-        </property>
+-        <property name="toolTip" >
+-         <string>Username/Identity for EAP methods</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="6" column="0" >
+-       <widget class="QLabel" name="passwordLabel" >
+-        <property name="text" >
+-         <string>Password</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="6" column="1" >
+-       <widget class="QLineEdit" name="passwordEdit" >
+-        <property name="enabled" >
+-         <bool>false</bool>
+-        </property>
+-        <property name="toolTip" >
+-         <string>Password for EAP methods</string>
+-        </property>
+-        <property name="echoMode" >
+-         <enum>QLineEdit::Password</enum>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="7" column="0" >
+-       <widget class="QLabel" name="cacertLabel" >
+-        <property name="text" >
+-         <string>CA certificate</string>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="7" column="1" >
+-       <widget class="QLineEdit" name="cacertEdit" >
+-        <property name="enabled" >
+-         <bool>false</bool>
+-        </property>
+-       </widget>
+-      </item>
+-      <item row="8" column="0" colspan="2" >
+-       <widget class="QGroupBox" name="wepBox" >
+-        <property name="enabled" >
+-         <bool>true</bool>
+-        </property>
+-        <property name="title" >
+-         <string>WEP keys</string>
+-        </property>
+-        <layout class="QGridLayout" >
+-         <item row="0" column="0" >
+-          <widget class="QRadioButton" name="wep0Radio" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-           <property name="text" >
+-            <string>key 0</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="1" column="0" >
+-          <widget class="QRadioButton" name="wep1Radio" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-           <property name="text" >
+-            <string>key 1</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="3" column="0" >
+-          <widget class="QRadioButton" name="wep3Radio" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-           <property name="text" >
+-            <string>key 3</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="2" column="0" >
+-          <widget class="QRadioButton" name="wep2Radio" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-           <property name="text" >
+-            <string>key 2</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="0" column="1" >
+-          <widget class="QLineEdit" name="wep0Edit" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="1" column="1" >
+-          <widget class="QLineEdit" name="wep1Edit" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="2" column="1" >
+-          <widget class="QLineEdit" name="wep2Edit" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="3" column="1" >
+-          <widget class="QLineEdit" name="wep3Edit" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-          </widget>
+-         </item>
+-        </layout>
+-       </widget>
+-      </item>
+-      <item row="9" column="0" colspan="2" >
+-       <widget class="QGroupBox" name="optionalSettingsBox" >
+-        <property name="enabled" >
+-         <bool>true</bool>
+-        </property>
+-        <property name="title" >
+-         <string>Optional Settings</string>
+-        </property>
+-        <layout class="QGridLayout" >
+-         <item row="0" column="1" >
+-          <widget class="QLineEdit" name="idstrEdit" >
+-           <property name="toolTip" >
+-            <string>Network Identification String</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="0" column="3" >
+-          <widget class="QSpinBox" name="prioritySpinBox" >
+-           <property name="toolTip" >
+-            <string>Network Priority</string>
+-           </property>
+-           <property name="maximum" >
+-            <number>10000</number>
+-           </property>
+-           <property name="singleStep" >
+-            <number>10</number>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="0" column="0" >
+-          <widget class="QLabel" name="idstrLabel" >
+-           <property name="text" >
+-            <string>IDString</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="0" column="2" >
+-          <widget class="QLabel" name="priorityLabel" >
+-           <property name="text" >
+-            <string>Priority</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="1" column="0" >
+-          <widget class="QLabel" name="phase2Label" >
+-           <property name="text" >
+-            <string>Inner auth</string>
+-           </property>
+-          </widget>
+-         </item>
+-         <item row="1" column="1" >
+-          <widget class="QComboBox" name="phase2Select" >
+-           <property name="enabled" >
+-            <bool>false</bool>
+-           </property>
+-          </widget>
+-         </item>
+-        </layout>
+-       </widget>
+-      </item>
+-     </layout>
+-    </widget>
+-   </item>
+-   <item row="1" column="2" >
+-    <widget class="QPushButton" name="addButton" >
+-     <property name="text" >
+-      <string>Add</string>
+-     </property>
+-    </widget>
+-   </item>
+-   <item row="1" column="3" >
+-    <widget class="QPushButton" name="removeButton" >
+-     <property name="enabled" >
+-      <bool>false</bool>
+-     </property>
+-     <property name="text" >
+-      <string>Remove</string>
+-     </property>
+-    </widget>
+-   </item>
+-   <item row="1" column="0" >
+-    <spacer>
+-     <property name="orientation" >
+-      <enum>Qt::Vertical</enum>
+-     </property>
+-     <property name="sizeHint" >
+-      <size>
+-       <width>20</width>
+-       <height>40</height>
+-      </size>
+-     </property>
+-    </spacer>
+-   </item>
+-   <item row="1" column="1" >
+-    <widget class="QPushButton" name="useWpsButton" >
+-     <property name="enabled" >
+-      <bool>false</bool>
+-     </property>
+-     <property name="text" >
+-      <string>WPS</string>
+-     </property>
++        </widget>
++       </item>
++      </layout>
++      <widget class="QPushButton" name="cancelButton">
++       <property name="geometry">
++        <rect>
++         <x>454</x>
++         <y>798</y>
++         <width>98</width>
++         <height>27</height>
++        </rect>
++       </property>
++       <property name="text">
++        <string>Cancel</string>
++       </property>
++      </widget>
++     </widget>
+     </widget>
+    </item>
+   </layout>
+  </widget>
+- <layoutdefault spacing="6" margin="11" />
+- <pixmapfunction></pixmapfunction>
+- <tabstops>
+-  <tabstop>ssidEdit</tabstop>
+-  <tabstop>authSelect</tabstop>
+-  <tabstop>encrSelect</tabstop>
+-  <tabstop>pskEdit</tabstop>
+-  <tabstop>eapSelect</tabstop>
+-  <tabstop>identityEdit</tabstop>
+-  <tabstop>passwordEdit</tabstop>
+-  <tabstop>cacertEdit</tabstop>
+-  <tabstop>wep0Radio</tabstop>
+-  <tabstop>wep0Edit</tabstop>
+-  <tabstop>wep1Radio</tabstop>
+-  <tabstop>wep1Edit</tabstop>
+-  <tabstop>wep2Radio</tabstop>
+-  <tabstop>wep2Edit</tabstop>
+-  <tabstop>wep3Radio</tabstop>
+-  <tabstop>wep3Edit</tabstop>
+-  <tabstop>idstrEdit</tabstop>
+-  <tabstop>prioritySpinBox</tabstop>
+-  <tabstop>phase2Select</tabstop>
+-  <tabstop>addButton</tabstop>
+-  <tabstop>removeButton</tabstop>
+-  <tabstop>cancelButton</tabstop>
+- </tabstops>
++ <layoutdefault spacing="6" margin="11"/>
+  <includes>
+-  <include location="global" >qtreewidget.h</include>
++  <include location="global">qtreewidget.h</include>
+  </includes>
+  <resources/>
+  <connections/>
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0002-wpa-gui-e-fix-display-issue-on-small-screen.patch b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0002-wpa-gui-e-fix-display-issue-on-small-screen.patch
new file mode 100644
index 0000000..d7d3916
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0002-wpa-gui-e-fix-display-issue-on-small-screen.patch
@@ -0,0 +1,845 @@
+From b17bacb507c040893913e955c12d044b7cdab2a1 Mon Sep 17 00:00:00 2001
+From: Moosa <moosa.baransi@babcomsoftware.com>
+Date: Mon, 27 Jun 2011 15:31:17 +0300
+Subject: [PATCH] wpa-gui-e: fix display issue on small screen
+
+Makes the main wpa-gui screen scrollable to allow using it on screens
+with low resolution in the "y" axis
+
+Upstream status: pending
+
+Signed-off-by: Moosa Baransi <moosa.baransi@babcomsoftware.com>
+
+---
+ wpa_supplicant/wpa_gui-qt4/wpagui.ui |  609 +++++++++++++++++-----------------
+ 1 files changed, 301 insertions(+), 308 deletions(-)
+
+diff --git a/wpagui.ui b/wpagui.ui
+index 9f9039f..9175971 100644
+--- a/wpagui.ui
++++ b/wpagui.ui
+@@ -1,230 +1,224 @@
+-<ui version="4.0" >
++<?xml version="1.0" encoding="UTF-8"?>
++<ui version="4.0">
+  <class>WpaGui</class>
+- <widget class="QMainWindow" name="WpaGui" >
+-  <property name="geometry" >
++ <widget class="QMainWindow" name="WpaGui">
++  <property name="geometry">
+    <rect>
+     <x>0</x>
+     <y>0</y>
+-    <width>345</width>
+-    <height>330</height>
++    <width>365</width>
++    <height>373</height>
+    </rect>
+   </property>
+-  <property name="windowTitle" >
++  <property name="windowTitle">
+    <string>wpa_gui</string>
+   </property>
+-  <property name="windowIcon" >
+-   <iconset resource="icons.qrc" >
++  <property name="windowIcon">
++   <iconset resource="icons.qrc">
+     <normaloff>:/icons/wpa_gui.svg</normaloff>:/icons/wpa_gui.svg</iconset>
+   </property>
+-  <widget class="QWidget" name="widget" >
+-   <layout class="QGridLayout" >
+-    <item row="0" column="0" >
+-     <widget class="QLabel" name="adapterLabel" >
+-      <property name="text" >
++  <widget class="QWidget" name="widget">
++   <layout class="QGridLayout">
++    <item row="0" column="0">
++     <widget class="QLabel" name="adapterLabel">
++      <property name="text">
+        <string>Adapter:</string>
+       </property>
+      </widget>
+     </item>
+-    <item row="0" column="1" >
+-     <widget class="QComboBox" name="adapterSelect" />
++    <item row="0" column="1">
++     <widget class="QComboBox" name="adapterSelect"/>
+     </item>
+-    <item row="1" column="0" >
+-     <widget class="QLabel" name="networkLabel" >
+-      <property name="text" >
++    <item row="1" column="0">
++     <widget class="QLabel" name="networkLabel">
++      <property name="text">
+        <string>Network:</string>
+       </property>
+      </widget>
+     </item>
+-    <item row="1" column="1" >
+-     <widget class="QComboBox" name="networkSelect" />
++    <item row="1" column="1">
++     <widget class="QComboBox" name="networkSelect"/>
+     </item>
+-    <item row="2" column="0" colspan="2" >
+-     <widget class="QTabWidget" name="wpaguiTab" >
+-      <property name="currentIndex" >
++    <item row="2" column="0" colspan="2">
++     <widget class="QTabWidget" name="wpaguiTab">
++      <property name="currentIndex">
+        <number>0</number>
+       </property>
+-      <widget class="QWidget" name="statusTab" >
+-       <attribute name="title" >
++      <widget class="QWidget" name="statusTab">
++       <attribute name="title">
+         <string>Current Status</string>
+        </attribute>
+-       <layout class="QGridLayout" >
+-        <item row="0" column="0" colspan="5" >
+-         <widget class="QFrame" name="frame3" >
+-          <property name="frameShape" >
+-           <enum>QFrame::NoFrame</enum>
+-          </property>
+-          <property name="frameShadow" >
+-           <enum>QFrame::Plain</enum>
++       <layout class="QGridLayout">
++        <item row="1" column="1">
++         <widget class="QPushButton" name="disconnectButton">
++          <property name="text">
++           <string>Disconnect</string>
+           </property>
+-          <layout class="QGridLayout" >
+-           <item row="0" column="0" >
+-            <widget class="QLabel" name="statusLabel" >
+-             <property name="text" >
+-              <string>Status:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="1" column="0" >
+-            <widget class="QLabel" name="lastMessageLabel" >
+-             <property name="text" >
+-              <string>Last message:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="2" column="0" >
+-            <widget class="QLabel" name="authenticationLabel" >
+-             <property name="text" >
+-              <string>Authentication:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="3" column="0" >
+-            <widget class="QLabel" name="encryptionLabel" >
+-             <property name="text" >
+-              <string>Encryption:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="4" column="0" >
+-            <widget class="QLabel" name="ssidLabel" >
+-             <property name="text" >
+-              <string>SSID:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="5" column="0" >
+-            <widget class="QLabel" name="bssidLabel" >
+-             <property name="text" >
+-              <string>BSSID:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="6" column="0" >
+-            <widget class="QLabel" name="ipAddressLabel" >
+-             <property name="text" >
+-              <string>IP address:</string>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="0" column="1" >
+-            <widget class="QLabel" name="textStatus" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="1" column="1" colspan="3" >
+-            <widget class="QLabel" name="textLastMessage" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="2" column="1" >
+-            <widget class="QLabel" name="textAuthentication" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="3" column="1" >
+-            <widget class="QLabel" name="textEncryption" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="4" column="1" >
+-            <widget class="QLabel" name="textSsid" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="5" column="1" >
+-            <widget class="QLabel" name="textBssid" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-           <item row="6" column="1" >
+-            <widget class="QLabel" name="textIpAddress" >
+-             <property name="text" >
+-              <string/>
+-             </property>
+-            </widget>
+-           </item>
+-          </layout>
+          </widget>
+         </item>
+-        <item row="1" column="0" >
+-         <spacer>
+-          <property name="orientation" >
+-           <enum>Qt::Vertical</enum>
+-          </property>
+-          <property name="sizeHint" >
+-           <size>
+-            <width>20</width>
+-            <height>40</height>
+-           </size>
+-          </property>
+-         </spacer>
+-        </item>
+-        <item row="1" column="1" >
+-         <widget class="QPushButton" name="connectButton" >
+-          <property name="text" >
+-           <string>Connect</string>
++        <item row="1" column="2">
++         <widget class="QPushButton" name="scanButton">
++          <property name="text">
++           <string>Scan</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="1" column="2" >
+-         <widget class="QPushButton" name="disconnectButton" >
+-          <property name="text" >
+-           <string>Disconnect</string>
++        <item row="1" column="0">
++         <widget class="QPushButton" name="connectButton">
++          <property name="text">
++           <string>Connect</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="1" column="3" >
+-         <widget class="QPushButton" name="scanButton" >
+-          <property name="text" >
+-           <string>Scan</string>
++        <item row="0" column="0" colspan="3">
++         <widget class="QScrollArea" name="scrollArea">
++          <property name="widgetResizable">
++           <bool>true</bool>
+           </property>
++          <widget class="QWidget" name="scrollAreaWidgetContents">
++           <property name="geometry">
++            <rect>
++             <x>0</x>
++             <y>0</y>
++             <width>307</width>
++             <height>191</height>
++            </rect>
++           </property>
++           <layout class="QGridLayout" name="gridLayout">
++            <item row="0" column="0">
++             <widget class="QFrame" name="frame3">
++              <property name="frameShape">
++               <enum>QFrame::NoFrame</enum>
++              </property>
++              <property name="frameShadow">
++               <enum>QFrame::Plain</enum>
++              </property>
++              <layout class="QGridLayout" name="_2">
++               <item row="0" column="0">
++                <widget class="QLabel" name="statusLabel">
++                 <property name="text">
++                  <string>Status:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="1" column="0">
++                <widget class="QLabel" name="lastMessageLabel">
++                 <property name="text">
++                  <string>Last message:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="2" column="0">
++                <widget class="QLabel" name="authenticationLabel">
++                 <property name="text">
++                  <string>Authentication:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="3" column="0">
++                <widget class="QLabel" name="encryptionLabel">
++                 <property name="text">
++                  <string>Encryption:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="4" column="0">
++                <widget class="QLabel" name="ssidLabel">
++                 <property name="text">
++                  <string>SSID:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="5" column="0">
++                <widget class="QLabel" name="bssidLabel">
++                 <property name="text">
++                  <string>BSSID:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="6" column="0">
++                <widget class="QLabel" name="ipAddressLabel">
++                 <property name="text">
++                  <string>IP address:</string>
++                 </property>
++                </widget>
++               </item>
++               <item row="0" column="1">
++                <widget class="QLabel" name="textStatus">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++               <item row="1" column="1" colspan="3">
++                <widget class="QLabel" name="textLastMessage">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++               <item row="2" column="1">
++                <widget class="QLabel" name="textAuthentication">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++               <item row="3" column="1">
++                <widget class="QLabel" name="textEncryption">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++               <item row="4" column="1">
++                <widget class="QLabel" name="textSsid">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++               <item row="5" column="1">
++                <widget class="QLabel" name="textBssid">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++               <item row="6" column="1">
++                <widget class="QLabel" name="textIpAddress">
++                 <property name="text">
++                  <string/>
++                 </property>
++                </widget>
++               </item>
++              </layout>
++             </widget>
++            </item>
++           </layout>
++          </widget>
+          </widget>
+         </item>
+-        <item row="1" column="4" >
+-         <spacer>
+-          <property name="orientation" >
+-           <enum>Qt::Vertical</enum>
+-          </property>
+-          <property name="sizeHint" >
+-           <size>
+-            <width>20</width>
+-            <height>40</height>
+-           </size>
+-          </property>
+-         </spacer>
+-        </item>
+        </layout>
+       </widget>
+-      <widget class="QWidget" name="networkconfigTab" >
+-       <attribute name="title" >
++      <widget class="QWidget" name="networkconfigTab">
++       <attribute name="title">
+         <string>Manage Networks</string>
+        </attribute>
+-       <layout class="QGridLayout" >
+-        <item row="0" column="0" colspan="5" >
+-         <widget class="QListWidget" name="networkList" >
+-          <property name="selectionRectVisible" >
++       <layout class="QGridLayout">
++        <item row="0" column="0" colspan="5">
++         <widget class="QListWidget" name="networkList">
++          <property name="selectionRectVisible">
+            <bool>true</bool>
+           </property>
+          </widget>
+         </item>
+-        <item rowspan="2" row="1" column="0" >
++        <item row="1" column="0" rowspan="2">
+          <spacer>
+-          <property name="orientation" >
++          <property name="orientation">
+            <enum>Qt::Vertical</enum>
+           </property>
+-          <property name="sizeHint" >
++          <property name="sizeHint" stdset="0">
+            <size>
+             <width>20</width>
+             <height>61</height>
+@@ -232,33 +226,33 @@
+           </property>
+          </spacer>
+         </item>
+-        <item row="1" column="1" >
+-         <widget class="QRadioButton" name="enableRadioButton" >
+-          <property name="text" >
++        <item row="1" column="1">
++         <widget class="QRadioButton" name="enableRadioButton">
++          <property name="text">
+            <string>Enabled</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="1" column="2" >
+-         <widget class="QPushButton" name="editNetworkButton" >
+-          <property name="text" >
++        <item row="1" column="2">
++         <widget class="QPushButton" name="editNetworkButton">
++          <property name="text">
+            <string>Edit</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="1" column="3" >
+-         <widget class="QPushButton" name="removeNetworkButton" >
+-          <property name="text" >
++        <item row="1" column="3">
++         <widget class="QPushButton" name="removeNetworkButton">
++          <property name="text">
+            <string>Remove</string>
+           </property>
+          </widget>
+         </item>
+-        <item rowspan="2" row="1" column="4" >
++        <item row="1" column="4" rowspan="2">
+          <spacer>
+-          <property name="orientation" >
++          <property name="orientation">
+            <enum>Qt::Vertical</enum>
+           </property>
+-          <property name="sizeHint" >
++          <property name="sizeHint" stdset="0">
+            <size>
+             <width>20</width>
+             <height>61</height>
+@@ -266,106 +260,106 @@
+           </property>
+          </spacer>
+         </item>
+-        <item row="2" column="1" >
+-         <widget class="QRadioButton" name="disableRadioButton" >
+-          <property name="text" >
++        <item row="2" column="1">
++         <widget class="QRadioButton" name="disableRadioButton">
++          <property name="text">
+            <string>Disabled</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="2" column="2" >
+-         <widget class="QPushButton" name="addNetworkButton" >
+-          <property name="text" >
++        <item row="2" column="2">
++         <widget class="QPushButton" name="addNetworkButton">
++          <property name="text">
+            <string>Add</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="2" column="3" >
+-         <widget class="QPushButton" name="scanNetworkButton" >
+-          <property name="text" >
++        <item row="2" column="3">
++         <widget class="QPushButton" name="scanNetworkButton">
++          <property name="text">
+            <string>Scan</string>
+           </property>
+          </widget>
+         </item>
+        </layout>
+       </widget>
+-      <widget class="QWidget" name="wpsTab" >
+-       <attribute name="title" >
++      <widget class="QWidget" name="wpsTab">
++       <attribute name="title">
+         <string>WPS</string>
+        </attribute>
+-       <layout class="QGridLayout" name="wpsGridLayout" >
+-        <item row="0" column="0" >
+-         <widget class="QLabel" name="label_2" >
+-          <property name="text" >
++       <layout class="QGridLayout" name="wpsGridLayout">
++        <item row="0" column="0">
++         <widget class="QLabel" name="label_2">
++          <property name="text">
+            <string>Status:</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="0" column="1" colspan="3" >
+-         <widget class="QLabel" name="wpsStatusText" >
+-          <property name="text" >
++        <item row="0" column="1" colspan="3">
++         <widget class="QLabel" name="wpsStatusText">
++          <property name="text">
+            <string/>
+           </property>
+          </widget>
+         </item>
+-        <item row="1" column="0" colspan="2" >
+-         <widget class="QPushButton" name="wpsPbcButton" >
+-          <property name="text" >
++        <item row="1" column="0" colspan="2">
++         <widget class="QPushButton" name="wpsPbcButton">
++          <property name="text">
+            <string>PBC - push button</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="2" column="0" colspan="2" >
+-         <widget class="QPushButton" name="wpsPinButton" >
+-          <property name="text" >
++        <item row="2" column="0" colspan="2">
++         <widget class="QPushButton" name="wpsPinButton">
++          <property name="text">
+            <string>Generate PIN</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="2" column="2" >
+-         <widget class="QLabel" name="label" >
+-          <property name="text" >
++        <item row="2" column="2">
++         <widget class="QLabel" name="label">
++          <property name="text">
+            <string>PIN:</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="2" column="3" >
+-         <widget class="QLineEdit" name="wpsPinEdit" >
+-          <property name="enabled" >
++        <item row="2" column="3">
++         <widget class="QLineEdit" name="wpsPinEdit">
++          <property name="enabled">
+            <bool>false</bool>
+           </property>
+-          <property name="readOnly" >
++          <property name="readOnly">
+            <bool>true</bool>
+           </property>
+          </widget>
+         </item>
+-        <item row="3" column="0" colspan="2" >
+-         <widget class="QPushButton" name="wpsApPinButton" >
+-          <property name="enabled" >
++        <item row="3" column="0" colspan="2">
++         <widget class="QPushButton" name="wpsApPinButton">
++          <property name="enabled">
+            <bool>false</bool>
+           </property>
+-          <property name="text" >
++          <property name="text">
+            <string>Use AP PIN</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="3" column="2" >
+-         <widget class="QLabel" name="label_3" >
+-          <property name="text" >
++        <item row="3" column="2">
++         <widget class="QLabel" name="label_3">
++          <property name="text">
+            <string>AP PIN:</string>
+           </property>
+          </widget>
+         </item>
+-        <item row="3" column="3" >
+-         <widget class="QLineEdit" name="wpsApPinEdit" >
+-          <property name="enabled" >
++        <item row="3" column="3">
++         <widget class="QLineEdit" name="wpsApPinEdit">
++          <property name="enabled">
+            <bool>false</bool>
+           </property>
+          </widget>
+         </item>
+-        <item row="4" column="0" colspan="4" >
+-         <widget class="QTextEdit" name="wpsInstructions" >
+-          <property name="readOnly" >
++        <item row="4" column="0" colspan="4">
++         <widget class="QTextEdit" name="wpsInstructions">
++          <property name="readOnly">
+            <bool>true</bool>
+           </property>
+          </widget>
+@@ -376,149 +370,148 @@
+     </item>
+    </layout>
+   </widget>
+-  <widget class="QMenuBar" name="MenuBar" >
+-   <property name="geometry" >
++  <widget class="QMenuBar" name="MenuBar">
++   <property name="geometry">
+     <rect>
+      <x>0</x>
+      <y>0</y>
+-     <width>345</width>
+-     <height>24</height>
++     <width>365</width>
++     <height>23</height>
+     </rect>
+    </property>
+-   <widget class="QMenu" name="fileMenu" >
+-    <property name="title" >
++   <widget class="QMenu" name="fileMenu">
++    <property name="title">
+      <string>&amp;File</string>
+     </property>
+-    <addaction name="fileEventHistoryAction" />
+-    <addaction name="fileSaveConfigAction" />
+-    <addaction name="actionWPS" />
+-    <addaction name="actionPeers" />
+-    <addaction name="separator" />
+-    <addaction name="fileExitAction" />
++    <addaction name="fileEventHistoryAction"/>
++    <addaction name="fileSaveConfigAction"/>
++    <addaction name="actionWPS"/>
++    <addaction name="actionPeers"/>
++    <addaction name="separator"/>
++    <addaction name="fileExitAction"/>
+    </widget>
+-   <widget class="QMenu" name="networkMenu" >
+-    <property name="title" >
++   <widget class="QMenu" name="networkMenu">
++    <property name="title">
+      <string>&amp;Network</string>
+     </property>
+-    <addaction name="networkAddAction" />
+-    <addaction name="networkEditAction" />
+-    <addaction name="networkRemoveAction" />
+-    <addaction name="separator" />
+-    <addaction name="networkEnableAllAction" />
+-    <addaction name="networkDisableAllAction" />
+-    <addaction name="networkRemoveAllAction" />
++    <addaction name="networkAddAction"/>
++    <addaction name="networkEditAction"/>
++    <addaction name="networkRemoveAction"/>
++    <addaction name="separator"/>
++    <addaction name="networkEnableAllAction"/>
++    <addaction name="networkDisableAllAction"/>
++    <addaction name="networkRemoveAllAction"/>
+    </widget>
+-   <widget class="QMenu" name="helpMenu" >
+-    <property name="title" >
++   <widget class="QMenu" name="helpMenu">
++    <property name="title">
+      <string>&amp;Help</string>
+     </property>
+-    <addaction name="helpContentsAction" />
+-    <addaction name="helpIndexAction" />
+-    <addaction name="separator" />
+-    <addaction name="helpAboutAction" />
++    <addaction name="helpContentsAction"/>
++    <addaction name="helpIndexAction"/>
++    <addaction name="separator"/>
++    <addaction name="helpAboutAction"/>
+    </widget>
+-   <addaction name="fileMenu" />
+-   <addaction name="networkMenu" />
+-   <addaction name="helpMenu" />
++   <addaction name="fileMenu"/>
++   <addaction name="networkMenu"/>
++   <addaction name="helpMenu"/>
+   </widget>
+-  <action name="fileEventHistoryAction" >
+-   <property name="text" >
++  <action name="fileEventHistoryAction">
++   <property name="text">
+     <string>Event &amp;History</string>
+    </property>
+   </action>
+-  <action name="fileSaveConfigAction" >
+-   <property name="text" >
++  <action name="fileSaveConfigAction">
++   <property name="text">
+     <string>&amp;Save Configuration</string>
+    </property>
+-   <property name="shortcut" >
++   <property name="shortcut">
+     <string>Ctrl+S</string>
+    </property>
+   </action>
+-  <action name="fileExitAction" >
+-   <property name="text" >
++  <action name="fileExitAction">
++   <property name="text">
+     <string>E&amp;xit</string>
+    </property>
+-   <property name="shortcut" >
++   <property name="shortcut">
+     <string>Ctrl+Q</string>
+    </property>
+   </action>
+-  <action name="networkAddAction" >
+-   <property name="text" >
++  <action name="networkAddAction">
++   <property name="text">
+     <string>&amp;Add</string>
+    </property>
+   </action>
+-  <action name="networkEditAction" >
+-   <property name="text" >
++  <action name="networkEditAction">
++   <property name="text">
+     <string>&amp;Edit</string>
+    </property>
+   </action>
+-  <action name="networkRemoveAction" >
+-   <property name="text" >
++  <action name="networkRemoveAction">
++   <property name="text">
+     <string>&amp;Remove</string>
+    </property>
+   </action>
+-  <action name="networkEnableAllAction" >
+-   <property name="text" >
++  <action name="networkEnableAllAction">
++   <property name="text">
+     <string>E&amp;nable All</string>
+    </property>
+   </action>
+-  <action name="networkDisableAllAction" >
+-   <property name="text" >
++  <action name="networkDisableAllAction">
++   <property name="text">
+     <string>&amp;Disable All</string>
+    </property>
+   </action>
+-  <action name="networkRemoveAllAction" >
+-   <property name="text" >
++  <action name="networkRemoveAllAction">
++   <property name="text">
+     <string>Re&amp;move All</string>
+    </property>
+   </action>
+-  <action name="helpContentsAction" >
+-   <property name="enabled" >
++  <action name="helpContentsAction">
++   <property name="enabled">
+     <bool>false</bool>
+    </property>
+-   <property name="text" >
++   <property name="text">
+     <string>&amp;Contents...</string>
+    </property>
+   </action>
+-  <action name="helpIndexAction" >
+-   <property name="enabled" >
++  <action name="helpIndexAction">
++   <property name="enabled">
+     <bool>false</bool>
+    </property>
+-   <property name="text" >
++   <property name="text">
+     <string>&amp;Index...</string>
+    </property>
+   </action>
+-  <action name="helpAboutAction" >
+-   <property name="text" >
++  <action name="helpAboutAction">
++   <property name="text">
+     <string>&amp;About</string>
+    </property>
+   </action>
+-  <action name="actionWPS" >
+-   <property name="enabled" >
++  <action name="actionWPS">
++   <property name="enabled">
+     <bool>false</bool>
+    </property>
+-   <property name="text" >
++   <property name="text">
+     <string>&amp;Wi-Fi Protected Setup</string>
+    </property>
+   </action>
+-  <action name="actionPeers" >
+-   <property name="text" >
++  <action name="actionPeers">
++   <property name="text">
+     <string>&amp;Peers</string>
+    </property>
+   </action>
+  </widget>
+- <layoutdefault spacing="6" margin="11" />
+- <pixmapfunction></pixmapfunction>
++ <layoutdefault spacing="6" margin="11"/>
+  <includes>
+-  <include location="global" >qtimer.h</include>
+-  <include location="global" >qsocketnotifier.h</include>
+-  <include location="local" >wpamsg.h</include>
+-  <include location="local" >eventhistory.h</include>
+-  <include location="local" >scanresults.h</include>
+-  <include location="local" >peers.h</include>
++  <include location="global">qtimer.h</include>
++  <include location="global">qsocketnotifier.h</include>
++  <include location="local">wpamsg.h</include>
++  <include location="local">eventhistory.h</include>
++  <include location="local">scanresults.h</include>
++  <include location="local">peers.h</include>
+  </includes>
+  <resources>
+-  <include location="icons.qrc" />
++  <include location="icons.qrc"/>
+  </resources>
+  <connections/>
+ </ui>
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0003-wpa-gui-trigger-udhcpc-on-connection-to-new-access-p.patch b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0003-wpa-gui-trigger-udhcpc-on-connection-to-new-access-p.patch
new file mode 100644
index 0000000..acd2477
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/0003-wpa-gui-trigger-udhcpc-on-connection-to-new-access-p.patch
@@ -0,0 +1,72 @@
+From 1043f0e3138a92ff76b13fcc9d15025e9f046938 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 29 Jun 2011 14:33:56 +0300
+Subject: [PATCH] wpa-gui:trigger udhcpc on connection to new access point
+
+When establishing a connection with an access point run a shell script
+that is used for triggering a dhcp request
+
+upstream-status: pending
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>wpa
+---
+ wpagui.cpp |   11 ++++++++++-
+ wpagui.h   |    1 +
+ 2 files changed, 11 insertions(+), 1 deletions(-)
+ mode change 100644 => 100755 wpagui.cpp
+ mode change 100644 => 100755 wpagui.h
+
+diff --git awpagui.cpp b/wpagui.cpp
+old mode 100644
+new mode 100755
+index 97bf5ac..e9b0701
+--- a/wpagui.cpp
++++ b/wpagui.cpp
+@@ -26,6 +26,7 @@
+ #include <QCloseEvent>
+ #include <QImageReader>
+ #include <QSettings>
++#include <QProcess>
+
+ #include "wpagui.h"
+ #include "dirent.h"
+@@ -174,7 +175,7 @@ WpaGui::WpaGui(QApplication *_app, QWidget *parent, const char *, Qt::WFlags)
+		printf("Failed to open control connection to "
+		       "wpa_supplicant.\n");
+	}
+-
++        isConnectionEstablished = false;
+	updateStatus();
+	networkMayHaveChanged = true;
+	updateNetworks();
+@@ -554,6 +555,14 @@ void WpaGui::updateStatus()
+			} else if (strcmp(start, "wpa_state") == 0) {
+				status_updated = true;
+				textStatus->setText(wpaStateTranslate(pos));
++                                if (textStatus->text() == "Completed") {
++                                    if (!isConnectionEstablished) {
++                                        QProcess::execute(QString("/usr/share/wpa_gui/connection_script.sh"));
++                                        isConnectionEstablished = true;
++                                    }
++                                }
++                                else
++                                    isConnectionEstablished = false;
+			} else if (strcmp(start, "key_mgmt") == 0) {
+				auth_updated = true;
+				textAuthentication->setText(pos);
+diff --git a/wpa_supplicant/wpa_gui-qt4/wpagui.h b/wpa_supplicant/wpa_gui-qt4/wpagui.h
+old mode 100644
+new mode 100755
+index 2e1af8e..b93fcb1
+--- a/wpagui.h
++++ b/wpagui.h
+@@ -122,6 +122,7 @@ private:
+	void createTrayIcon(bool);
+	bool ackTrayIcon;
+	bool startInTray;
++        bool isConnectionEstablished;
+
+	int openCtrlConnection(const char *ifname);
+
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/connection_script.sh b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/connection_script.sh
new file mode 100644
index 0000000..d22bc31
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e/connection_script.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# on first connection to a new AP we need to trigger the dhcp client for
+# getting an ip address
+
+cat /var/run/udhcpc.wlan0.pid | xargs /bin/kill -SIGUSR1
diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend
new file mode 100755
index 0000000..3596b4d
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bbappend
@@ -0,0 +1,16 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
+
+SRC_URI += "file://0001-wpa_gui-make-the-networkconfig-dialog-scrollable.patch \
+            file://0002-wpa-gui-e-fix-display-issue-on-small-screen.patch \
+            file://0003-wpa-gui-trigger-udhcpc-on-connection-to-new-access-p.patch \
+            file://connection_script.sh"
+
+do_install_append () {
+       install -d ${D}${datadir}/wpa_gui
+       install -m 0755 ${WORKDIR}/connection_script.sh ${D}${datadir}/wpa_gui
+}
+
+FILES_${PN} += "${datadir}/wpa_gui/connection_script.sh"
-- 
1.7.0.4


