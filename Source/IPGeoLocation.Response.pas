{******************************************************************************}
{                                                                              }
{           IPGeoLocation.Providers.Response                                   }
{                                                                              }
{           Copyright (C) Ant�nio Jos� Medeiros Schneider J�nior               }
{                                                                              }
{           https://github.com/antoniojmsjr/IPGeoLocation                      }
{                                                                              }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}
unit IPGeoLocation.Response;

interface

uses System.SysUtils, REST.JSon.Types, IPGeoLocation.Interfaces;

type

  {$REGION 'TIPGeoLocationResponse'}

  TIPGeoLocationResponse = class sealed(TInterfacedObject, IIPGeoLocationResponse)
  private
    { private declarations }
    [JsonName('ip')]
    FIP: string;
    [JsonName('provider')]
    FProvider: string;
    [JsonName('hostname')]
    FHostName: string;
    [JsonName('country_code')]
    FCountryCode: string;
    [JsonName('country_code3')]
    FCountryCode3: string;
    [JsonName('country_name')]
    FCountryName: string;
    [JsonName('country_flag')]
    FCountryFlag: string;
    [JsonName('region')]
    FRegion: string;
    [JsonName('city')]
    FCity: string;
    [JsonName('zip_code')]
    FZipCode: string;
    [JsonName('latitude')]
    FLatitude: double;
    [JsonName('longitude')]
    FLongitude: double;
    [JsonName('timezone_offset')]
    FTimeZoneOffset: string;
    [JsonName('timezone_name')]
    FTimeZoneName: string;
    [JsonName('isp')]
    FISP: string;
    [JSONMarshalled(False)]
    FJSON: string;
    function ObjectToJSON: string;

    //INTERFACE
    function GetIP: string;
    function GetProvider: string;
    function GetHostName: string;
    function GetCountryCode: string;
    function GetCountryCode3: string;
    function GetCountryName: string;
    function GetCountryFlag: string;
    function GetRegion: string;
    function GetCity: string;
    function GetZipCode: string;
    function GetLatitude: double;
    function GetLongitude: double;
    function GetTimeZoneName: string;
    function GetTimeZoneOffset: string;
    function GetISP: string;
    function GetJSON: string;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create; overload;
    constructor Create(const pIP: string; const pProvider: string;
                       const pHostName: string; const pCountryCode: string;
                       const pCountryCode3: string; const pCountryName: string;
                       const pCountryFlag: string; const pRegion: string;
                       const pCity: string; const pZipCode: string;
                       const pLatitude: double; const pLongitude: double;
                       const pTimeZoneName: string;
                       const pTimeZoneOffset: string;
                       const pISP: string); overload;
  end;

  {$ENDREGION}

implementation

uses System.JSON, REST.Json;

{$REGION 'TIPGeoLocationResponse'}

constructor TIPGeoLocationResponse.Create;
begin
  FIP             := EmptyStr;
  FProvider       := EmptyStr;
  FHostName       := EmptyStr;
  FCountryCode    := EmptyStr;
  FCountryCode3   := EmptyStr;
  FCountryName    := EmptyStr;
  FCountryFlag    := EmptyStr;
  FRegion         := EmptyStr;
  FCity           := EmptyStr;
  FZipCode        := EmptyStr;
  FLatitude       := 0.00;
  FLongitude      := 0.00;
  FTimeZoneOffset := EmptyStr;
  FTimeZoneName   := EmptyStr;
  FISP            := EmptyStr;
  FJSON           := EmptyStr;
end;

constructor TIPGeoLocationResponse.Create(const pIP: string;
  const pProvider: string; const pHostName: string; const pCountryCode: string;
  const pCountryCode3: string; const pCountryName: string;
  const pCountryFlag: string; const pRegion: string;
  const pCity: string; const pZipCode: string; const pLatitude: double;
  const pLongitude: double; const pTimeZoneName: string;
  const pTimeZoneOffset: string; const pISP: string);
begin
  Create;

  FIP             := pIP;
  FProvider       := pProvider;
  FHostName       := pHostName;
  FCountryCode    := pCountryCode;
  FCountryCode3   := pCountryCode3;
  FCountryName    := pCountryName;
  FCountryFlag    := pCountryFlag;
  FRegion         := pRegion;
  FCity           := pCity;
  FZipCode        := pZipCode;
  FLatitude       := pLatitude;
  FLongitude      := pLongitude;
  FTimeZoneName   := pTimeZoneName;
  FTimeZoneOffset := pTimeZoneOffset;
  FISP            := pISP;

  //TRANSFORMA��O DO OBJETO PARA JSON
  FJSON := ObjectToJSON;
end;

function TIPGeoLocationResponse.GetCity: string;
begin
  Result := FCity;
end;

function TIPGeoLocationResponse.GetCountryCode: string;
begin
  Result := FCountryCode;
end;

function TIPGeoLocationResponse.GetCountryCode3: string;
begin
  Result := FCountryCode3;
end;

function TIPGeoLocationResponse.GetCountryFlag: string;
begin
  Result := FCountryFlag;
end;

function TIPGeoLocationResponse.GetCountryName: string;
begin
  Result := FCountryName;
end;

function TIPGeoLocationResponse.GetHostName: string;
begin
  Result := FHostName;
end;

function TIPGeoLocationResponse.GetIP: string;
begin
  Result := FIP;
end;

function TIPGeoLocationResponse.GetISP: string;
begin
  Result := FISP;
end;

function TIPGeoLocationResponse.GetJSON: string;
begin
  Result := FJSON;
end;

function TIPGeoLocationResponse.GetLatitude: double;
begin
  Result := FLatitude;
end;

function TIPGeoLocationResponse.GetLongitude: double;
begin
  Result := FLongitude;
end;

function TIPGeoLocationResponse.GetProvider: string;
begin
  Result := FProvider;
end;

function TIPGeoLocationResponse.GetRegion: string;
begin
  Result := FRegion;
end;

function TIPGeoLocationResponse.GetTimeZoneName: string;
begin
  Result := FTimeZoneName;
end;

function TIPGeoLocationResponse.GetTimeZoneOffset: string;
begin
  Result := FTimeZoneOffset;
end;

function TIPGeoLocationResponse.GetZipCode: string;
begin
  Result := FZipCode;
end;

function TIPGeoLocationResponse.ObjectToJSON: string;
var
  lJSONObject: TJSONObject;
begin
  Result := EmptyStr;

  lJSONObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joDateFormatISO8601]);

  try
    Result := lJSONObject.ToJSON;
  finally
    if Assigned(lJSONObject) then
      FreeAndNil(lJSONObject);
  end;
end;

{$ENDREGION}

end.
